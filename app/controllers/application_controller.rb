class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_user, :active_class

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    redirect_to login_path unless logged_in?
  end

  def active_class(link_path)
      current_page?(link_path) ? "active" : ""
  end

end
