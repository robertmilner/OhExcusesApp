class PagesController < ApplicationController
  def home
    @excuses = Excuse.random(1)
  end

  def search
  end

  def location
    if params[:search]
      @locations = Location.where('name LIKE ?', "%#{params[:search]}%")
    else
      @locations = Location.all
    end
  end

  def tag
  end

  def favorite
  end

  def user
  end
end
