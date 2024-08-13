class RestaurantsController < ApplicationController

  def top
    @restaurants = Restaurant.where(rating: 5)
    # render 'index' # show this view instead of default behavior
  end

  def chef
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { restaurant: restaurant }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
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

  def edit
    @restaurant= Restaurant.find(params[:id])
  end

  def update
    @restaurant= Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant= Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    # whitelisting our form data -> only allowing what we want from the user
    params.require(:restaurant).permit(:name, :address, :rating, :opening_date)
  end
end
