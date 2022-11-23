class LaptopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_laptop, only: %i[destroy]

  def index
    @laptops = Laptop.all
    if params[:search]
      @search_term = params[:search]
      @laptops = @laptops.where("brand LIKE ?", "#{@search_term}")
    end
  end

  def show
    @laptop = Laptop.find(params[:id])
  end

  def new
    @laptop = Laptop.new
  end

  def create
    @laptop = Laptop.new(laptop_params)
    @laptop.list = @laptops
    if @laptop.save
      redirect_to laptop_path(@laptops)
    else
      render :new
    end
  end

  def detroy
    @laptop.destroy
    redirect_to laptop_path
  end

  private

  def laptop_params
    params.require(:year_built, :brand, :model, :screen_size, :hard_drive, :ram, :user, :price).permit(:photo)
  end

  def set_laptop
    @laptop = Laptop.find(params[:laptop_id])
  end
end
