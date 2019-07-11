class PostsController < ApplicationController

  before_action :require_user
  before_action :correct_user, only:[:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private
  def post_params
    params.require(:post).permit(:choice, :body, :address)
  end
  def correct_user
    @post = Post.find(params[:id])
  end
end
