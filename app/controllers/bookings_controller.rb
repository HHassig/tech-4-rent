class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_laptop, only: %i[new create]

  def index
    @bookings = Booking.all
    @user_bookings = Booking.where(user_id: current_user.id)
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
    @booking.user = current_user
    @booking.save!
    redirect_to laptop_bookings_path(@booking)
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
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_laptop
    @laptop = Laptop.find(params[:laptop_id])
  end
end
