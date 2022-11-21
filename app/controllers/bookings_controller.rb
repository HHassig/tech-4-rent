class BookingsController < ApplicationController
  before_action :set_bookmark, only: :destroy
  # before_action :set_list, only: %i[new create]
  def show
    @bookings = Booking.all
  end

  def new
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
    params.require(:renter, :laptop, :duration)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # def set_list
  #   @list = List.find(params[:list_id])
  # end
end
