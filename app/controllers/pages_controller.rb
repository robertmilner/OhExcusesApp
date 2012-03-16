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
  end

  def tag
  end

  def favorite
    @user = @current_user
    # the user model favorable method was changes to grab the ids with "id IN (?)", [1, 2, 3, 4]
    @excuses = @user.favorable(:type => :excuse, :delve => :true)
    # the above favorable method runs the following SQL query
    # Favorite.find(:all, :conditions => ["user_id = ? AND favorable_type = ?", self.id, type])
    # then, where [114, 122] and the ids of excuses that have been favorited by the user
    # Excuse.find(:all, :conditions => [ "id IN (?)", [114, 122] ])
  end

  def user
    @user = @current_user
    @excuses = @user.favorable(:type => :excuse, :delve => :true)
  end
end
