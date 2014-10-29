module UserHelper
  def fullname(user)
      user.first_name.capitalize + " " + user.last_name.capitalize
  end
end