class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)

    if @user.save
      redirect_to root_path, notice: "Thanks for registering!"
    else
      render :new
    end

  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :rant_freq)
  end
end