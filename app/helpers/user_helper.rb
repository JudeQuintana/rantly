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

  def is_me?(user)
    current_user == user
  end

end