class PagesController < ApplicationController

  # setting the current user if there is one
  before_filter :require_login, :except => :excuse
  before_filter :current_user

  def excuse
    @user = @current_user
    # arguments [0] = total number of results
    @excuses = Excuse.random(5)
  end

  def search
    @user = @current_user
    # arguments [0] = params[:search], [1] = total number of results
    @excuses = Excuse.search(params[:search], 5)
  end

  def location
    @user = @current_user
    # arguments [0] = params[:search], [1] = total number of results
    @excuses = Excuse.search_location(params[:search], 5)
  end

  def tag
    @user = @current_user
    # @excuses = Excuse.search_tag(params[:search], 5)
    @excuses = Excuse.limit(5)
  end

  def favorite
    @user = @current_user
    # the user model favorable method was changes to grab the ids with "id IN (?)", [1, 2, 3, 4]
    @favorites = @user.favorable(:type => :excuse, :delve => :true)
    # the above favorable method runs the following SQL query
    # Favorite.find(:all, :conditions => ["user_id = ? AND favorable_type = ?", self.id, type])
    # then, where [114, 122] and the ids of excuses that have been favorited by the use
    # Excuse.find(:all, :conditions => [ "id IN (?)", [114, 122] ])
  end

  def user
    @user = @current_user
    @excuses = @user.excuses
    @favorites = @user.favorable(:type => :excuse, :delve => :true)
  end
end
