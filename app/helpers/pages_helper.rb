module PagesHelper

  def favorited_image_tag(excuse, user)
    # need to figure out how to check if current excuse is favorited by the current user
    # this is currently not working
    if excuse.user == user.favorites
      image_tag "heart_red.svg", :class => "btn-favorite true", :alt => ""
    else
      image_tag "heart_black.svg", :class => "btn-favorite", :alt => ""
    end
  end



end
