class PagesController < ApplicationController
  def home
    @excuses = Excuse.random(1)
  end

  def search
  end

  def location
    @locations = Location.all
  end

  def tag
  end

  def favorite
  end

  def user
  end
end
