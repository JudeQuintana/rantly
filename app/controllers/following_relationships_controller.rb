class FollowingRelationshipsController < ApplicationController

  def index
    @followed_users = current_user.followed_users
  end

  def create
    user = User.find_by(id: params[:id])

    current_user.followed_users << user
    redirect_to :back
  end

  def destroy

    user = User.find_by(id: params[:id])

    current_user.followed_users.delete(user)

    redirect_to :back

  end

end