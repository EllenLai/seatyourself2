class RestaurantsController < ApplicationController
	before_filter :ensure_logged_in, :only => [:show]

  def index
  	@restaurants = Restaurant.all
  end

  def show
  	@restaurant = Restaurant.find(params[:id])

  	if current_guest
  		@reservation = @restaurant.reservations.build
  	end
  end

  def new
  	@restaurant = Restaurant.new
  end

def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_url
    else
      render :new
    end
  end

  def edit
  	@restaurant = Restaurant.find(params[:id])
  end


def update
	@restaurant = Restaurant.find(params[:id])

	if @restaurant.update_attributes(restaurant_params)
		redirect_to restaurant_path(@restaurant)
	else
		render :edit
	end
end

 private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :summary, :url)
  end

end