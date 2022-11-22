class StaticsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]
  def home
    @laptops = Laptop.all
  end

  def about
  end
end
