class UsersController < ApplicationController

  before_action :authorize, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # creating the cookie when a new user is created so they have full access to the site
      redirect_to user_path(@user)
    end
  end

  def update
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
