class ReviewsController < ApplicationController
  def create
    @laptop = Laptop.find(params[:laptop_id])
    @review = Review.new(review_params)
    @review.laptop = @laptop
    if @review.save
      redirect_to laptops_path(@laptop)
    else
      render "laptops/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
