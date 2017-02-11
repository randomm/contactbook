class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by username: (params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id unless user.nil?
      redirect_to user, notice: "Welcome back!"
    else
      redirect_to root_path, notice: "Username and password do not match"
    end
  end


  def destroy
    user = current_user
    session[:user_id] = nil
    redirect_to signin_path, notice: "#{user.username} logged out."
  end

end
