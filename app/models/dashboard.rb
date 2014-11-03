class Dashboard
  def initialize(user, rant=nil)
    @user = user
    @rant = rant
  end

  def new_rant
    @rant ||= Rant.new
  end

  def latest_rants
    Rant.where.not(user_id: @user.id)
  end

  def my_rants
    @user.rants
  end
end