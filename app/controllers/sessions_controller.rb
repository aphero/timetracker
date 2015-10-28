class SessionsController < ApplicationController
  skip_before_action :require_login, only: :create

  def new
  end

  def create
    dev = Developer.find_by_email(set_params[:email])
    if dev && dev.authenticate(set_params[:password])
      session[:user_id] = dev.id
      redirect_to developer_path(dev.id), notice: "You have been successfully logged in."
    else
      redirect_to login_path 'Invalid email/password combination'
    end
  end

  def destroy
    session[:name] = nil
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logout successful.'
  end

  private

    def set_params
      params.require(:session).permit(:name, :email, :password)
    end

end
