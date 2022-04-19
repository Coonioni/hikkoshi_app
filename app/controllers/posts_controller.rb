class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).all
    @tags = @post.tags
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
    # puts "createメソッド開始"
    # @tag = Tag.find(1)
    # puts "tag_id" + params[:tag_id]
    @post = Post.new(post_params.merge!(user_id: current_user.id))
    @post.save

    @post_tag = PostTag.new
    post_param = params[:post]
    @post_tag.tag_id = post_param['tag_ids']
    @post_tag.post_id = @post.id
    
    if @post_tag.save
      puts "登録に成功しました"
    else
      puts "登録に失敗しました。"
      puts @post.id
      puts @post_tag.tag_id
      puts "デバッグ終了"
    end

    redirect_to controller: "posts", action: "index"
    puts "createメソッド終了"
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.id == post.user.id
      post.destroy
      flash.now[:success] = "削除が完了しました。"
      redirect_to controller: "posts", action: "index"
    else
      render "posts/show"
    end
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
