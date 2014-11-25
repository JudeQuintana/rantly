class CommentsController < ApplicationController

  def create

    @rant = Rant.find_by(id: params[:rant_id])

    @comment = @rant.comments.build(comment_params)

    if @comment.save
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge({user_id: current_user.id})
  end

end