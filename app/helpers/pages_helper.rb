module PagesHelper

  def favorited_image_tag(excuse, user)
    # need to figure out how to check if current excuse is favorited by the current user
    # this is currently not working
    if excuse.favorites.map(&:user_id).include?(user.id)
      image_tag "heart_red.png", :class => "btn-favorite true", :alt => ""
    else
      image_tag "heart_black.png", :class => "btn-favorite", :alt => ""
    end
  end



end
