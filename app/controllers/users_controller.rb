class UsersController < ApplicationController

  def new

  end

  def show
    @user = User.find_by(id: params[:id])

  end


  def edit

    @user = User.find_by(id: params[:id])

  end

  def update

    @user = User.find_by(id: params[:id])

    @user.update(allowed_params)

    redirect_to dashboard_path, notice: "Profile updated!"

  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :rant_freq, :image)
  end
end