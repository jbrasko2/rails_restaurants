class RestaurantsController < ApplicationController
  layout 'restaurant'
  include RestaurantsHelper
  def index
      if params[:cuisine_id]
        @cuisine = Cuisine.find_by_id(params[:cuisine_id])
        @restaurants = @cuisine.restaurants
      else
        @restaurants = filter(params[:filter])
      end
  end

  def new
    if params[:cuisine_id]
      @cuisine = Cuisine.find_by_id(params[:cuisine_id])
      @restaurant = @cuisine.restaurants.build
    else
      @restaurant = Restaurant.new
      @restaurant.build_cuisine
    end
  end

  def create
    # binding.pry
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def edit
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def update
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def high_dollar
    @restaurants = Restaurant.high_dollar.sort_by_rating
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :price, :rating, :is_chain, :cuisine_id, cuisine_attributes: [:name])
  end

end
