class ReservationsController < ApplicationController
	before_filter :load_restaurant, except: [:index]
  before_filter :load_guest, except: [:index, :create]
	before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]

  def index
    if params[:guest_id]
      @object = Guest.find(params[:guest_id])
    elsif params[:restaurant_id]
      @object = Restaurant.find(params[:restaurant_id])
    end
    @reservations = @object.reservations.all
  end


  def show
  	@reservation = Reservation.find(params[:id])
  end

  def create
  	@reservation = @restaurant.reservations.build(reservation_params)
  	@reservation.guest_id = current_guest.id

  	if @reservation.save
  		redirect_to restaurants_path, notice: 'Reservation created successfully'
  	else

  		render :action => :show
  	end
  end

 def destroy
 	@reservation = Reservation.find(params[:id])
 	@reservation.destroy
 end


private

def reservation_params
	params.require(:reservation).permit(:time, :date, :restaurant_id, :guest_id, :number_of_guests)
end

def load_restaurant
	@restaurant = Restaurant.find(params[:restaurant_id])
end

def load_guest
  @guest = Guest.find(params[:guest_id])
end

end