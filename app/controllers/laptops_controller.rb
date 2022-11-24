class LaptopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_laptop, only: %i[destroy]

  def index
    @laptops = Laptop.all.paginate(page: params[:page], per_page: 12)
    if params[:search].present?
      @search_term = params[:search]
      @laptops = @laptops.where("brand ILIKE ?", "%#{@search_term}%")
    end
  end

  def show
    @laptop = Laptop.find(params[:id])
    @markers = [{ lat: @laptop.latitude, lng: @laptop.longitude }]
    @booking = Booking.new
    @laptops = Laptop.all
    @review = all_reviews(@laptop)
  end

  def new
    @laptop = Laptop.new
  end

  def create
    @laptop = Laptop.new(laptop_params)
    @laptop.user = current_user
    if @laptop.save
      redirect_to laptop_path(@laptop), notice: 'Laptop was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @laptop.update(laptop_params)
      redirect_to laptops_path(@laptop)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @laptop.destroy
    redirect_to laptops_path
  end

  private

  def laptop_params
    params.require(:laptop).permit(:brand, :year_built, :model, :screen_size, :hard_drive, :ram, :user, :price, :photo, :address)
  end

  def set_laptop
    @laptop = Laptop.find(params[:laptop_id])
  end

  def all_reviews(laptop)
    reviews = Review.where(:laptop_id => laptop.id.to_i)
    sum = 0
    reviews.each do |review_object|
      sum += review_object.review
    end
    return sum.to_f/reviews.count
  end
end
