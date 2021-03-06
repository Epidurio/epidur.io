class AnaestheticsController < ApplicationController
  before_action :authenticate_user!
  before_action :anaesthetist_only
  before_action :set_patient, except: [:all_anaesthetics]
  before_action :set_anaesthetic, except: [:index, :all_anaesthetics, :new, :create]


  # GET /anaesthetics
  # GET /anaesthetics.json
  def index
    @anaesthetics =@patient.anaesthetics
  end

  def all_anaesthetics
    @anaesthetics = Anaesthetic.all
  end

  # GET /anaesthetics/1
  # GET /anaesthetics/1.json
  def show
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



    # Never trust parameters from the scary internet, only allow the white list through.
    def anaesthetic_params
      params.require(:anaesthetic).permit(:intervention_id,:user_id, :patient_id, :date_and_time, :intervention, :indication, :no_attempts, :complications)
    end
end
