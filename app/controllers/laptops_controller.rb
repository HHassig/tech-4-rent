class LaptopsController < ApplicationController
  def new
    @laptop = Laptop.new
  end
end
