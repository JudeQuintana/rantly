class SessionsController < ApplicationController
  skip_before_action :ensure_authenticated_user

  def new
    @user = User.new
  end
  
  def create

    @user = User.find_by(username: allowed_params[:username])

    if @user && @user.authenticate(allowed_params[:password])

      session[:user_id] = @user.id

      redirect_to dashboard_path, notice: "You're now logged in!"

    else
      @user = User.new
      @user.errors[:base] = "Username/Password invalid!"
      render :new
    end

    
  end

  def destroy

    session.destroy

    redirect_to root_path, notice: "You're now logged out"

  end
  
  private
  
  def allowed_params
    params.require(:user).permit(:username, :password)
  end

end
