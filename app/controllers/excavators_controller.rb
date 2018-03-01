class ExcavatorsController < ApplicationController
  before_action :set_excavator, only: [:show, :edit, :update, :destroy]

  # GET /excavators
  # GET /excavators.json
  def index
    @excavators = Excavator.all
  end

  # GET /excavators/1
  # GET /excavators/1.json
  def show
  end

  # GET /excavators/new
  def new
    @excavator = Excavator.new
  end

  # GET /excavators/1/edit
  def edit
  end

  # POST /excavators
  # POST /excavators.json
  def create
    @excavator = Excavator.new(excavator_params)

    respond_to do |format|
      if @excavator.save
        format.html { redirect_to @excavator, notice: 'Excavator was successfully created.' }
        format.json { render :show, status: :created, location: @excavator }
      else
        format.html { render :new }
        format.json { render json: @excavator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /excavators/1
  # PATCH/PUT /excavators/1.json
  def update
    respond_to do |format|
      if @excavator.update(excavator_params)
        format.html { redirect_to @excavator, notice: 'Excavator was successfully updated.' }
        format.json { render :show, status: :ok, location: @excavator }
      else
        format.html { render :edit }
        format.json { render json: @excavator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excavators/1
  # DELETE /excavators/1.json
  def destroy
    @excavator.destroy
    respond_to do |format|
      format.html { redirect_to excavators_url, notice: 'Excavator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excavator
      @excavator = Excavator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def excavator_params
      params.require(:excavator).permit(:ticket_id, :company_name, :address, :city, :state, :zip, :crew_on_site)
    end
end