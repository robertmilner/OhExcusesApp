class ApplicationController < ActionController::Base

  # rails stuff
  protect_from_forgery

  # methods
  def require_login
    if session[:user_id].blank?
      redirect_to root_url, :notice => "You must be signed in to do that."
      return false
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
