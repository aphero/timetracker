class SessionsController < ApplicationController

  def create
    dev = Developer.find_by_email(params :email)
    if dev && dev.authenticate(params :password)
      session[:login] = true
      session[:name] = dev.name
      session[:user_id] = dev.id
      redirect_to projects_path, notice: "You have been successfully logged in."
    else
      redirect_to login_path 'Invalid email/password combination' # Not quite right!
    end
  end

  def destroy

  end

  private

    def set_params
      params.require(:session).permit(:name, :email, :password)
    end

end
