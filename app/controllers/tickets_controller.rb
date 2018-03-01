class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_from_json
  	# Create Ticket
  	@ticket = Ticket.new do |t|
  		t.request_number = params['RequestNumber']
  		t.sequence_number = params['SequenceNumber']
  		t.request_type = params['RequestType']
  		t.response_due_date_time = params['DateTimes']['ResponseDueDateTime']
  		t.primary_service_area_code = params['ServiceArea']['PrimaryServiceAreaCode']['SACode']
  		t.additional_service_area_code = params['ServiceArea']['AdditionalServiceAreaCodes']['SACode']
  		t.well_known_text = params['ExcavationInfo']['DigsiteInfo']['WellKnownText']
  	end

	if @ticket.save
		# Create Excavator
	  	@excavator = Excavator.new do |e|
	  		e.company_name = params['Excavator']['CompanyName']
	  		e.address = params['Excavator']['Address']
	  		e.city = params['Excavator']['City']
	  		e.state = params['Excavator']['State']
	  		e.zip = params['Excavator']['Zip']
	  		e.crew_on_site = params['Excavator']['CrewOnsite']
	  	end
	  	@ticket.excavators << @excavator
	  	
		render json: @ticket, status: :created
	else
		render json: @ticket.errors, status: :unprocessable_entity
	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:request_number, :sequence_number, :request_type, 
      	:response_due_date_time, :primary_service_area_code, :additional_service_area_code, :well_known_text)
    end
end