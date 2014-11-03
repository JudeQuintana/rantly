class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    favorite = Favorite.new(allowed_params)
    if favorite.save
      redirect_to :back
    end
  end

  def destroy
    favorite = Favorite.find_by(allowed_params)
    favorite.destroy
    redirect_to :back
  end

  private

  def allowed_params
    params.permit(:rant_id).merge(user_id: current_user.id)
  end
end