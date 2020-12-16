class RestaurantsController < ApplicationController
  
  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def index
    # byebug
    if params[:expensive]
      @restaurants = Restaurant.high_dollar.sort_by_rating
    elsif params[:price]
      @restaurants = Restaurant.sort_by_price
    else
      @restaurants = Restaurant.sort_by_rating
    end
  end

  def high_dollar
    @restaurants = Restaurant.high_dollar.sort_by_rating
  end

end
