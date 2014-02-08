class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_guest
  	@current_guest ||= Guest.find(session[:guest_id]) if session[:guest_id]
  end

  helper_method :current_guest
end
