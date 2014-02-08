class GuestsController < ApplicationController
  def new
  	@guest = Guest.new
  end

  def create
  	@guest = Guest.new(guest_params)
  	if @guest.save
  		redirect_to restaurants_url, :notice => "Signed up!"
  	else
  		render "new"
  	end
  end

 private

def guest_params
	params.require(:guest).permit(:first_name, :last_name, :email, :telephone, :password, :password_confirmation)
end

end
