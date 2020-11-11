class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new 
  end

  def create
    @restaurant = Restaurant.new(params_strong)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private 

  def params_strong
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
