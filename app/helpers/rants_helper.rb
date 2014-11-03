module RantsHelper

  def latest_rants
    Rant.where.not(user_id: current_user.id).order(id: :asc)
  end

  def my_rants
    current_user.rants.order(id: :desc)
  end

end