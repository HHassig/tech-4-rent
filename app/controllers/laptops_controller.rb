class LaptopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_laptop, only: :destroy
  before_action :set_list, only: %i[new create]

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
    params.require(:laptop).permit(:title, :price, :user, :photo)
  end

  def set_laptop
    @laptop = Laptop.find(params[:id])
  end

  def set_list
    @laptops = Laptop.find(params[:laptop_id])
  end
end
