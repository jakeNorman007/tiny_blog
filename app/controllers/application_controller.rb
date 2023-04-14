class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # two bang turns current_user method into a bool
    !!current_user
  end

  def require_user
    # self explaintory, checks and handles that you can't do logged in things while not being logged in
    if !logged_in?
      flash[:alert] = "You must be logged in to do that."
      redirect_to login_path
    end
  end
end
