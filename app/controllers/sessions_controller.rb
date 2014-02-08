class SessionsController < ApplicationController
  def new

  end

  def create
  	guest = Guest.find_by_email(params[:email])
  	if guest && guest.authenticate(params[:password])
  		session[:guest_id] = guest.id
  		redirect_to restaurants_url, :notice => "Logged in!"
  	else
  		render "new"
  	end
  end

  def destroy
  	session[:guest_id] = nil
  	redirect_to restaurants_url, :notice => "Logged out!"
  end
end
