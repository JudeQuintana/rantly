class RantsController < ApplicationController

  def create
    @rant = Rant.new(allowed_params)

    if @rant.save
      redirect_to dashboard_path, notice: "Rant created!"
    else
      @user = User.find_by(id: allowed_params[:user_id])
      render 'dashboard/index'
    end
  end

  private

  def allowed_params
    params.require(:rant).permit(:title, :body).merge(user_id: params[:user_id])
  end

end