class PostsController < ApplicationController
  helper_method :time_calculation
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

  def time_calculation(created_at_time, time_now = Time.new)
  time_difference_in_sec = time_now - created_at_time
  if time_difference_in_sec < 60
    "#{time_difference_in_sec.to_i} seconds ago"
  elsif time_difference_in_sec < 3600
    "#{(time_difference_in_sec / 60).to_i} minutes ago"
  elsif time_difference_in_sec < 86_400
    "#{((time_difference_in_sec / 60) / 60).to_i} hours ago"
  elsif time_difference_in_sec < 31_540_000
    "#{(((time_difference_in_sec / 60) / 60) / 24).to_i} days ago"
  else
    'Over 1 year old'
  end
end

  private
  def post_params
    params.require(:post).permit(:choice, :body, :address)
  end
end
