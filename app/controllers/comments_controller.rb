class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    if !@comment.save
      flash[:notice] = @comment.errors.full.messages.to_sentence
    end
    redirect_to post_path(params[:post_id])
    @post.create_notification_comment(current_user, @comment.id)
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    redirect_to [:post, {id: params[:post_id] }]
  end

  private
  
    def comment_params
      params.require(:comment)
      .permit(:content)
      .merge(
        post_id: params[:post_id],
        user_id: current_user.id)
    end
    
end
