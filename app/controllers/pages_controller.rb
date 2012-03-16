class PagesController < ApplicationController

  # setting the current user if there is one
  before_filter :current_user

  def excuse
    # arguments [0] = total number of results
    @excuses = Excuse.random(5)
  end

  def search
    # arguments [0] = params[:search], [1] = total number of results
    @excuses = Excuse.search(params[:search], 5)
  end

  def location
    # arguments [0] = params[:search], [1] = total number of results
    @excuses = Excuse.location(params[:search], 5)
    # @locations = Location.search(params[:search], 5)
    # @locations.each do |location|
    #   @excuses = location.excuses
    # end
  end

  def tag
  end

  def favorite
  end

  def user
    @user = @current_user
    @excuses = @user.excuses
    @favorites = @user.favorites
  end
end
