class FollowingRelationshipsController < ApplicationController

  def index
    @followed_users = current_user.followed_users
  end

  def create
    current_user.follow(user)
    redirect_to :back
  end

  def destroy
    current_user.unfollow(user)
    redirect_to :back
  end

  private

  def user
    @_user ||= User.find_by(id: params[:id])
  end
end