class PatientsController < ApplicationController

  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index


    if params[:first_name].present? || params[:last_name].present?
      @patients = Patient.where("first_name ILIKE ? AND last_name ILIKE ?", "%#{params[:first_name]}%", "%#{params[:last_name]}%")
    else
      @patients = Patient.all
      #@patients = Patient.review

    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    # Connect to Cerner FHIR Server to get demographics from MRN number
    @client = FHIR::Client.new('https://fhir-open.sandboxcerner.com/dstu2/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca')
    FHIR::Model.client = @client
    demo = @client.read(FHIR::Patient, patient_params[:MRN], 'application/json+fhir').resource

    # Connect to openEHR to create an EHR with this user and get ehrId
    url = URI("https://cdr.code4health.org/rest/v1/ehr?subjectId=#{patient_params[:MRN]}&subjectNamespace=uk.nhs.nhs_number&commiterName=%7B%7BcommitterName%7D%7D")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["content-type"] = 'application/json'
    request["authorization"] = 'Basic aWFubWNuaWNvbGxfOGQwMjlmZWYtNzcwZC00OWYyLTliZWYtYmQxZTIxYWY5NDU3OiQyYSQxMCQ2MTlraQ=='
    request.body = "{\n    \"subjectId\": \"#{patient_params[:MRN]}\",\n    \"subjectNamespace\": \"uk.nhs.nhs_number\",\n  \"queryable\": \"true\",\n  \"modifiable\": \"true\"\n}"
    response = http.request(request)
    @patient = Patient.new(patient_params)
    @patient.update(ehr_id: JSON.parse(response.read_body)["ehrId"])
    @patient.update(first_name: demo.name[0].given.first)
    @patient.update(last_name: demo.name.last.family.first)
    @patient.update(DOB: demo.birthDate)
    @patient.update(MRN: demo.id)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :DOB, :MRN, :NHS_No, :ehr_id, :status)
    end
end
