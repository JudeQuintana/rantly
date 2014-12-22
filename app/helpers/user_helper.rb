module UserHelper
  def fullname(user)
    user.first_name.capitalize + " " + user.last_name.capitalize
  end

  def follow_button(user)
    unless is_me?(user)
      if current_user.follow_user?(user)
        button_to 'Unfollow', follow_path(user), method: :delete
      else
        button_to 'Follow', follow_path(user)
      end
    end
  end

  def favorite_button(rant)
    unless is_me?(rant.user)
      if fav = current_user.favorited?(rant)
        button_to 'Unfavorite', rant_favorite_path(rant, fav), method: :delete
      else
        button_to 'Favorite', rant_favorites_path(rant)
      end
    end
  end

  def spam_button(rant)
    unless is_me?(rant.user)
      if rant.spam == false
        button_to 'Spam', rant_path(rant), method: :put
      end
    end
  end

  def is_me?(user)
    current_user == user
  end

end