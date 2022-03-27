class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).all
  end

  def edit 
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post = @post.update(post_params)
    redirect_to posts_path
  end
  
  def new
    @post = Post.new
  end

  def create
    Post.create( post_params.merge!(user_id: current_user.id))
    redirect_to controller: "posts", action: "index"
  end

  def destroy
    post = Post.find(params[:id])
    flash.now[:success] = "削除が完了しました。"
    redirect_to controller: "posts", action: "index"
  end

  def liked?(user)
    likes.where(user_id: user.id).exist?
  end

  private
    def post_params
      params.require(:post).permit(:post_content, :address)
    end

    def logged_in_user
      unless logged_in?
        flash.now[:danger] = "ログインしてください"
        redirect_to controller: "homes", action: "index" 
      end
    end

end
