class RestaurantsController < ApplicationController
  
  def index

    if params[:expensive]
      @restaurants = Restaurant.high_dollar.sort_by_rating
    elsif params[:price]
      @restaurants = Restaurant.sort_by_price
    elsif params[:search] 
      @restaurants = Restaurant.where('name Like ?', "%#{params[:search]}%")
    else
      @restaurants = Restaurant.sort_by_rating
    end
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.build_cuisine
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
    binding.pry
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
