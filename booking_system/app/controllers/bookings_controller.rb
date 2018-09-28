class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_time_and_category_arrays
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @Rooms = Room.all
    @bookings = Booking.all
    if params[:booking]!=nil
      redirect_to "/bookings/new/&f=#{params[:booking]["start_time(4i)"]}#{params[:booking]["start_time(5i)"]}&l=#{params[:booking]["end_time(4i)"]}#{params[:booking]["end_time(5i)"]}&d=#{params[:booking][:date]}"
    end
    if params[:date].blank?
      @date = Date.today.strftime
    else
      @date = params[:date]
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show

  end

  def requests
    @requests = Request.all
  end


  # GET /bookings/new
  def new
    @booking = Booking.new
    @bookings = Booking.all
    @rooms = Room.all

    @start_time = "0900"
    @end_time = "1830"
    @date = Date.today.strftime("%Y-%m-%d")
  end

  def results
    @rooms = Room.all
    @booking = Booking.new
    @bookings = Booking.all

    @criteria = request.path.split("/").last
    @criteriaArr = @criteria.split(/&\w=/)

    @start_time = @criteriaArr[1]
    @end_time = @criteriaArr[2]
    @date = @criteriaArr[3]

    @available_rooms = []

    @rooms.each do |r|
      if r.isFree @date, @start_time, @end_time
        @available_rooms.push r
      end
    end

  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    if user_signed_in?
      @booking = Booking.new(new_booking_params)
      @start_time = @booking.start.strftime("%H%M")
      @end_time = @booking.end.strftime("%H%M")

      respond_to do |format|
        if @booking.save
          format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    else
      @request = Request.new(new_booking_params)
      @start_time = @request.start.strftime("%H%M")
      @end_time = @request.end.strftime("%H%M")

      respond_to do |format|
        if @request.save
          format.html { redirect_to bookings_path, notice: 'Request was successfully created.' }
          format.json { render :index, status: :created, location: @request }
        else
          format.html { render :new }
          format.json { render json: @request.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(update_booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_and_category_arrays
      @times = ['0900','0930','1000','1030','1100','1130','1200','1230','1300','1330','1400','1430','1500','1530','1600','1630','1700','1730','1800','1830']
      @categories = ['Academy Visit','One-on-One','Training Session','Sparta Day','Client Interview','Sparta Day Interview','Other']
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def room_search_params
      params.require(:booking).permit(:date, :start_time, :end_time)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_booking_params
      params.require(:booking).permit(:date, :start, :end, :room_id, :description, :category)
    end

    def update_booking_params
      params.require(:booking).permit(:description, :category, :booking_id)
    end
end
