class PostsController < ApplicationController
  before_action :require_user
  before_action :correct_user, only:[:edit, :update, :destroy]
  helper_method :time_calculation

  def index
    sentimentbar
    @posts = []
    @all_posts = Post.all.order(created_at: :desc)
    @all_posts.each do |p|
    @posts << p if (Time.new - p.created_at) < 86400
    gon.preference = @all_posts
    @sentiment_store = $analyser.score @all_posts
    tempHash = @sentiment_store.to_json
      File.open("sentiment.json","a") do |f|
        f.write(JSON.pretty_generate(tempHash))
      end
    end
  end

  def sentimentbar
    positive = 0.00
    negative = 0.00
    neutral = 0.00
    i = 0
    all_body = Post.find_by_sql("SELECT body FROM posts WHERE choice = 'Emotion';")
    @sentiment_word_store = []
    while i < all_body.length
      body = all_body[i].body
      mark = $analyser.sentiment body
      @sentiment_word_store.push(mark)
      i += 1
    end
    j = 0
    while j < @sentiment_word_store.length
      if @sentiment_word_store[j] == :positive
        positive += 1
      elsif @sentiment_word_store[j] == :negative
        negative += 1
      else
        neutral += 1
      end
      j += 1
    end
    total = (positive + negative + neutral)
    @positive_sent = ((positive*100)/total).round
    @neutral_sent = ((neutral*100)/total).round
    @negative_sent = ((negative*100)/total).round
  end

  def postsJS
    render json: { status: 200, all_stories: Post.all }
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Your post has been added"
      redirect_to posts_path
    else
      render 'new'
    end
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Your posts has been updated"
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Your post has been deleted'
    redirect_to posts_path
  end


  def time_calculation(created_at_time, time_now = Time.new)
  time_difference_in_sec = time_now - created_at_time
  if time_difference_in_sec < 60
    "#{time_difference_in_sec.to_i} seconds ago"
  elsif time_difference_in_sec < 3600
    "#{(time_difference_in_sec / 60).to_i} minutes ago"
  else time_difference_in_sec < 86_400
    "#{((time_difference_in_sec / 60) / 60).to_i} hours ago"
  end
end

  private
  def post_params
    params.require(:post).permit(:choice, :body, :latitude, :longitude)
  end
  def correct_user
    @post = Post.find(params[:id])
  end
end
