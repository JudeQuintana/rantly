module RantsHelper

  def new_rant
    Rant.new
  end

  def latest_rants
    Rant.where.not(user_id: current_user.id)
  end

  def my_rants
    current_user.rants
  end

end