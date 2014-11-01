class DashboardController < ApplicationController

  def index
    @rant = Rant.new
  end
end