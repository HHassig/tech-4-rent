class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_laptop, only: %i[new create]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @laptops = Laptop.all
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.laptop = @laptop
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:user, :laptop_id).permit(:duration)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_laptop
    @laptop = Laptop.find(params[:laptop_id])
  end
end
