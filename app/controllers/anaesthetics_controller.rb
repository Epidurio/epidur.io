class AnaestheticsController < ApplicationController
  before_action :authenticate_user!
  before_action :anaesthetist_only
  # before_action :set_patient, except: [:all_anaesthetics]
  # before_action :set_anaesthetic, except: [:index, :all_anaesthetics, :new, :create]


  # GET /anaesthetics
  # GET /anaesthetics.json
  def index
    @all_reports_for_one_patient = openehr_get_list_of_anaesthetics(ehrid_from_cernermrn)["resultSet"]
  end

  def all_anaesthetics
    @anaesthetics = Anaesthetic.all
  end

  # GET /anaesthetics/1
  # GET /anaesthetics/1.json
  def show
    @anaesthetic = get_anaesthetic_composition(params[:id])
  end

  # GET /anaesthetics/new
  def new
    @anaesthetic = @patient.anaesthetics.new
  end

  # GET /anaesthetics/1/edit
  def edit


  end

  # POST /anaesthetics
  # POST /anaesthetics.json
  def create
    @anaesthetic = @patient.anaesthetics.new(anaesthetic_params)


    respond_to do |format|
      if @anaesthetic.save
        format.html { redirect_to patient_anaesthetics_url(@patient), notice: 'Anaesthetic was successfully created.' }
        format.json { render :index, status: :created, location: @anaesthetic }
      else
        format.html { render :new }
        format.json { render json: @anaesthetic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anaesthetics/1
  # PATCH/PUT /anaesthetics/1.json
  def update
    respond_to do |format|
      if @anaesthetic.update(anaesthetic_params)
        format.html { redirect_to [@patient, @anaesthetic], notice: 'Anaesthetic was successfully updated.' }
        format.json { render :show, status: :ok, location: @anaesthetic }
      else
        format.html { render :edit }
        format.json { render json: @anaesthetic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anaesthetics/1
  # DELETE /anaesthetics/1.json
  def destroy
    @anaesthetic.destroy
    respond_to do |format|
      format.html { redirect_to patient_anaesthetics_url(@patient), notice: 'Anaesthetic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anaesthetic
      @anaesthetic = @patient.anaesthetics.find(params[:id]) rescue Anaesthetic.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id]) # rescue Patient.first rescue Anaesthetic.find(params[:id])
    end

    def anaesthetist_only
    unless current_user.anaesthetist?
      redirect_to :back, :alert => "You must be an anaesthetist to access this page."
    end
  end

  def ehrid_from_cernermrn
    # hardcoded MRN in the URL string
    url = URI("https://cdr.code4health.org/rest/v1/ehr/?subjectId=1316025&subjectNamespace=uk.nhs.nhs_number")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["authorization"] = 'Basic aWFubWNuaWNvbGxfOGQwMjlmZWYtNzcwZC00OWYyLTliZWYtYmQxZTIxYWY5NDU3OiQyYSQxMCQ2MTlraQ=='
    request["content-type"] = 'application/json'
    request["ehr-session-disabled"] = '09ec03be-a0ca-48bc-bf0b-6681bfde5342'
    response = http.request(request)
    @response_hash = JSON.parse(response.read_body)
    @ehrid = @response_hash["ehrId"]
  end

  def openehr_get_list_of_anaesthetics(ehr_id)
    url = URI("https://cdr.code4health.org/rest/v1/query")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/json'
    request["authorization"] = 'Basic aWFubWNuaWNvbGxfOGQwMjlmZWYtNzcwZC00OWYyLTliZWYtYmQxZTIxYWY5NDU3OiQyYSQxMCQ2MTlraQ=='
    request.body = "{ \"aql\": \"select     a/uid/value as uid,     a/composer/name as clinician_name,     a/context/start_time/value as start_date,     b_a/items[at0001]/value/magnitude as attempts,     b_a/items[at0010]/value/value as position,     b_b/description[at0001]/items[at0014]/value/value as indication,     b_b/description[at0001]/items[at0006]/value/value as complication from EHR e [ehr_id/value = '#{ehr_id}'] contains COMPOSITION a[openEHR-EHR-COMPOSITION.report-procedure.v1] contains (     CLUSTER b_a[openEHR-EHR-CLUSTER.epidural_detail.v0] and     ACTION b_b[openEHR-EHR-ACTION.procedure.v1]) where a/name/value='Epidural Repport' order by a/context/start_time/value DESC\"}"
    response = http.request(request)
    @response_hash = JSON.parse(response.read_body)
  end

  def get_anaesthetic_composition(composition_id)
    url = URI("https://cdr.code4health.org/rest/v1/composition/#{composition_id}?format=FLAT")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["content-type"] = 'application/json'
    request["authorization"] = 'Basic aWFubWNuaWNvbGxfOGQwMjlmZWYtNzcwZC00OWYyLTliZWYtYmQxZTIxYWY5NDU3OiQyYSQxMCQ2MTlraQ=='
    response = http.request(request)
    @response_hash = JSON.parse(response.read_body)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anaesthetic_params
      params.require(:anaesthetic).permit(:intervention_id,:user_id, :patient_id, :date_and_time, :intervention, :indication, :no_attempts, :complications)
    end
end
