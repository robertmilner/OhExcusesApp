class PagesController < ApplicationController
  def excuse
    # arguments [0] = total number of results
    @excuses = Excuse.random(5)
  end

  def search
    # arguments [0] = params[:search], [1] = total number of results
    @excuses = Excuse.search(params[:words], 5)
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
