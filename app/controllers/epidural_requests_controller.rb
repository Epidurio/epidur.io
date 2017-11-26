class EpiduralRequestsController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'

  before_action :set_epidural_request, only: [:edit, :update, :destroy]

  # GET /epidural_requests
  # GET /epidural_requests.json
  def index
    @epidural_requests = EpiduralRequest.all
  end

  # GET /epidural_requests/1
  # GET /epidural_requests/1.json
  def show
    ehrid = ehrid_from_cernermrn

    @epidural_request = EpiduralRequest.new
  end

  # GET /epidural_requests/new
  def new
    @epidural_request = EpiduralRequest.new
  end

  # GET /epidural_requests/1/edit
  def edit
  end

  # POST /epidural_requests
  # POST /epidural_requests.json
  def create
    @epidural_request = EpiduralRequest.new(epidural_request_params)

    respond_to do |format|
      if @epidural_request.save
        format.html { redirect_to @epidural_request, notice: 'Epidural request was successfully created.' }
        format.json { render :show, status: :created, location: @epidural_request }
      else
        format.html { render :new }
        format.json { render json: @epidural_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /epidural_requests/1
  # PATCH/PUT /epidural_requests/1.json
  def update
    respond_to do |format|
      if @epidural_request.update(epidural_request_params)
        format.html { redirect_to @epidural_request, notice: 'Epidural request was successfully updated.' }
        format.json { render :show, status: :ok, location: @epidural_request }
      else
        format.html { render :edit }
        format.json { render json: @epidural_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epidural_requests/1
  # DELETE /epidural_requests/1.json
  def destroy
    @epidural_request.destroy
    respond_to do |format|
      format.html { redirect_to epidural_requests_url, notice: 'Epidural request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_epidural_request
      @epidural_request = EpiduralRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def epidural_request_params
      params.require(:epidural_request).permit(:date_and_time, :patient_id, :user_id, :anticoagulants, :status, :platelets, :pyrexia, :cannula, :hypertension, :history)
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

end
