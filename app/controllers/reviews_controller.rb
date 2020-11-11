class ReviewsController < ApplicationController
  before_action :find_restaurant

  def new
    @review = Review.new  
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save # happy path
      redirect_to restaurant_path(@restaurant)
    else # unhappy path
      render :new
      # renders the html template for the 'new' action
      # while still in the create action
    end
  end
  
  private 

  def review_params
    params.require(:review).permit(:content, :rating)
  end
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
