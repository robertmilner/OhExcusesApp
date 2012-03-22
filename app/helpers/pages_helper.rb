module PagesHelper

  def favorited(excuse, user)
    "active" if excuse.favorites.find_by_favorable_id(excuse.id) == user.favorites.find_by_favorable_id(excuse.id)
  end

end
