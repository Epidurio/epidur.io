class RoomAllocationsController < ApplicationController
  before_action :set_room_allocation, only: [:show, :edit, :update, :destroy]

  # GET /room_allocations
  # GET /room_allocations.json
  def index
    @room_allocations = RoomAllocation.all
  end

  # GET /room_allocations/1
  # GET /room_allocations/1.json
  def show
  end

  # GET /room_allocations/new
  def new
    @room_allocation = RoomAllocation.new
  end

  # GET /room_allocations/1/edit
  def edit
  end

  # POST /room_allocations
  # POST /room_allocations.json
  def create
    @room_allocation = RoomAllocation.new(room_allocation_params)

    respond_to do |format|
      if @room_allocation.save
        format.html { redirect_to @room_allocation, notice: 'Room allocation was successfully created.' }
        format.json { render :show, status: :created, location: @room_allocation }
      else
        format.html { render :new }
        format.json { render json: @room_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_allocations/1
  # PATCH/PUT /room_allocations/1.json
  def update
    respond_to do |format|
      if @room_allocation.update(room_allocation_params)
        format.html { redirect_to @room_allocation, notice: 'Room allocation was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_allocation }
      else
        format.html { render :edit }
        format.json { render json: @room_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_allocations/1
  # DELETE /room_allocations/1.json
  def destroy
    @room_allocation.destroy
    respond_to do |format|
      format.html { redirect_to room_allocations_url, notice: 'Room allocation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_allocation
      @room_allocation = RoomAllocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_allocation_params
      params.require(:room_allocation).permit(:patient_id, :room_id)
    end
end
