class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    # THIS IS JUST FOR THE FORM
    @restaurant = Restaurant.new
  end

  # DOES NOT HAVE A VIEW
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # show the form again but with the @restaurant in this method
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    # whitelisting our form data -> only allowing what we want from the user
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
