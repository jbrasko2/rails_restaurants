class RestaurantsController < ApplicationController
  
  def index
    if params[:expensive]
      @restaurants = Restaurant.high_dollar.sort_by_rating
    elsif params[:price]
      @restaurants = Restaurant.sort_by_price
    else
      @restaurants = Restaurant.sort_by_rating
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create

    @restaurant = Restaurant.new(restaurant_params)
    # if restaurant_params[:name] == ""
    #   @errors << "Restaurant must have a name"
    # end
    # byebug
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # byebug
      render :new
      # redirect_to new_restaurant_path
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
    params.require(:restaurant).permit(:name, :name_confirmation, :cuisine, :description, :price, :rating, :is_chain)
  end

end
