class PagesController < ApplicationController

  # setting the current user if there is one
  before_filter :require_login, :only => [:favorite, :user]
  before_filter :current_user

  def excuse
    @user = @current_user
    # arguments [0] = total number of results
    @excuses = Excuse.find_excuses_by_random(5)
  end

  def search
    @user = @current_user
    if params[:name]
      @excuses = Excuse.find_excuses_by_named_text(params[:name], 5)
    elsif params[:search]
      @excuses = Excuse.search_excuses(params[:search], 5)
    else
      @excuses = Excuse.find_excuses_by_random(5)
    end
  end

  def location
    @user = @current_user
    if params[:name]
      @excuses = Location.find_excuses_by_named_location(params[:name], 5)
    elsif params[:search]
      @excuses = Location.find_excuses_by_searched_locations(params[:search], 5)
    else
      @excuses = Excuse.find_excuses_by_random(5)
    end
  end

  def tag
    @user = @current_user
    if params[:name]
      @excuses = Tag.find_excuses_by_named_tag(params[:name], 5)
    elsif params[:search]
      @excuses = Tag.find_excuses_by_searched_tags(params[:search], 5)
    else
      @excuses = Excuse.find_excuses_by_random(5)
    end
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
    @excuses = @user.excuses.limit(5)
    @favorites = @user.favorable(:type => :excuse, :delve => :true)
  end
  
  def robert
    @user = User.find_by_name('Robert Milner')
    @excuses = @user.excuses.all
  end
end
