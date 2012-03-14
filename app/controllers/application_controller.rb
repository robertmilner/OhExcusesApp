class ApplicationController < ActionController::Base

  # rails stuff
  protect_from_forgery

  # public methods
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
