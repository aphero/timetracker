class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  def logged_in?
    session[:user_id] == nil
  end

  def require_login
    unless logged_in?
      redirect_to login_path, notice: 'Please log in to view content'
    end
  end
end
