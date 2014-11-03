class RantsController < ApplicationController

  def create
    @rant = Rant.new(allowed_params)

    if @rant.save
      redirect_to dashboard_path, notice: "Rant created!"
    else
      @dashboard = Dashboard.new(current_user, @rant)
      @user = User.find_by(id: params[:user_id])
      render 'dashboard/index'
    end
  end

  def destroy

    @rant = Rant.find_by(id: params[:id])
    @rant.destroy

    redirect_to :back, notice: "Rant Deleted!"

  end

  def show
    @rant = Rant.find_by(id: params[:id])
  end

  private

  def allowed_params
    params.require(:rant).permit(:title, :body).merge(user_id: current_user.id)
  end

end