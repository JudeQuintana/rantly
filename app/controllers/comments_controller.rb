class CommentsController < ApplicationController

  def create

    create_comment_obj

    if @comment.save
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge({user_id: current_user.id})
  end

  def create_comment_obj
    if params[:rant_id]
      rant = Rant.find(params[:rant_id])
      @comment = rant.comments.build(comment_params)
    else
      user = User.find(params[:user_id])
      @comment = Comment.new(comment_params.merge({commentable_id: user.id, commentable_type: 'User'}))
    end
  end

end