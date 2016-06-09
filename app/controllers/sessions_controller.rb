class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id # creating the cookie
      redirect_to images_path
    elsif !@user
      flash[:danger] = 'That email does not exist the database. Please create an account'
      redirect_to new_session_path
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end
end
