class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}"
      redirect_to posts_path
    else
      flash[:error] = 'You need to stop and sort your shit out!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out, bye Felicia"
    redirect_to login_path
  end

end
