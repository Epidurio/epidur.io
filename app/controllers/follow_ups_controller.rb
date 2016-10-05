class FollowUpsController < ApplicationController
  before_action :set_patient
  before_action :set_follow_up, except: [:index, :new, :create]



  # GET /follow_ups
  # GET /follow_ups.json
  def index

    if params[:patient_id].present?
        @follow_ups =@patient.follow_ups
    else
        @follow_ups = FollowUp.all
    end

  end

  # GET /follow_ups/1
  # GET /follow_ups/1.json
  def show
  end

  # GET /follow_ups/new
  def new
    @follow_up = @patient.follow_ups.new

  end

  # GET /follow_ups/1/edit
  def edit
  end

  # POST /follow_ups
  # POST /follow_ups.json
  def create
      @follow_up = @patient.follow_ups.new(follow_up_params)
    #@follow_up = FollowUp.new(follow_up_params)

    respond_to do |format|
      if @follow_up.save
        format.html { redirect_to patient_follow_ups_url(@patient), notice: 'Follow up was successfully created.' }
        format.json { render :show, status: :created, location: @follow_up }
      else
        format.html { render :new }
        format.json { render json: @follow_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follow_ups/1
  # PATCH/PUT /follow_ups/1.json
  def update
    respond_to do |format|
      if @follow_up.update(follow_up_params)
        format.html { redirect_to [@patient, @follow_up], notice: 'Follow up was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow_up }
      else
        format.html { render :edit }
        format.json { render json: @follow_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follow_ups/1
  # DELETE /follow_ups/1.json
  def destroy
    @follow_up.destroy
    respond_to do |format|
      format.html { redirect_to patient_follow_ups_url(@patient), notice: 'Follow up was successfully destroyed.' }
      format.json { head :no_content }

      #redirect_to article_url(@comment.article_id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow_up
      @follow_up = @patient.follow_ups.find(params[:id]) rescue FollowUp.find(params[:id])
    end



    def set_patient
      @patient = Patient.find(params[:patient_id]) rescue Patient.first rescue FollowUp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follow_up_params
      params.require(:follow_up).permit(:date_and_time, :user_id, :patient_id, :nausea, :itching, :headache, :leg_weakness, :leg_numbness, :back_pain, :urinary_rentention, :pain, :awareness_GA, :comments, :status)
    end
end
