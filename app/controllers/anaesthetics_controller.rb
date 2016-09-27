class AnaestheticsController < ApplicationController
  before_action :set_anaesthetic, only: [:show, :edit, :update, :destroy]

  # GET /anaesthetics
  # GET /anaesthetics.json
  def index
    @anaesthetics = Anaesthetic.all
  end

  # GET /anaesthetics/1
  # GET /anaesthetics/1.json
  def show
  end

  # GET /anaesthetics/new
  def new
    @anaesthetic = Anaesthetic.new
  end

  # GET /anaesthetics/1/edit
  def edit
  end

  # POST /anaesthetics
  # POST /anaesthetics.json
  def create
    @anaesthetic = Anaesthetic.new(anaesthetic_params)

    respond_to do |format|
      if @anaesthetic.save
        format.html { redirect_to @anaesthetic, notice: 'Anaesthetic was successfully created.' }
        format.json { render :show, status: :created, location: @anaesthetic }
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
        format.html { redirect_to @anaesthetic, notice: 'Anaesthetic was successfully updated.' }
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
      format.html { redirect_to anaesthetics_url, notice: 'Anaesthetic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anaesthetic
      @anaesthetic = Anaesthetic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anaesthetic_params
      params.require(:anaesthetic).permit(:user_id, :patient_id, :date_and_time, :intervention, :indication, :no_attempts, :complications)
    end
end
