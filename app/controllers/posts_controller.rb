class PostsController < ApplicationController
  def new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private
  def post_params
    params.require(:post).permit(:type, :body, :address)
  end
end
