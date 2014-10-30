module UserHelper
  def fullname(user)
      user.first_name.capitalize + " " + user.last_name.capitalize
  end

  def follow_button(user)
    button_to 'Follow', user_follow_path(user)
    end

  def unfollow_button(user)
    button_to 'Unfollow', user_unfollow_path(user), method: :delete
  end

  def follow_user?(user)
    current_user.followed_users.include?(user)
  end

  def is_me?(user)
    current_user == user
  end
end