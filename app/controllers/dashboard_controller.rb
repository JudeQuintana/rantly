class DashboardController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    @rant = Rant.new
  end

end