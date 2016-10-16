class TestformsController < ApplicationController
  before_action :set_testform, only: [:show, :edit, :update, :destroy]

  # GET /testforms
  # GET /testforms.json
  def index
    @testforms = Testform.all
  end

  # GET /testforms/1
  # GET /testforms/1.json
  def show
  end

  # GET /testforms/new
  def new
    @testform = Testform.new
  end

  # GET /testforms/1/edit
  def edit
  end

  # POST /testforms
  # POST /testforms.json
  def create
    @testform = Testform.new(testform_params)

    respond_to do |format|
      if @testform.save
        format.html { redirect_to @testform, notice: 'Testform was successfully created.' }
        format.json { render :show, status: :created, location: @testform }
      else
        format.html { render :new }
        format.json { render json: @testform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testforms/1
  # PATCH/PUT /testforms/1.json
  def update
    respond_to do |format|
      if @testform.update(testform_params)
        format.html { redirect_to @testform, notice: 'Testform was successfully updated.' }
        format.json { render :show, status: :ok, location: @testform }
      else
        format.html { render :edit }
        format.json { render json: @testform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testforms/1
  # DELETE /testforms/1.json
  def destroy
    @testform.destroy
    respond_to do |format|
      format.html { redirect_to testforms_url, notice: 'Testform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testform
      @testform = Testform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testform_params
      params.require(:testform).permit(:name, :date)
    end
end
