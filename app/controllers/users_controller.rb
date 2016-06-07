class UsersController < ApplicationController

  before_action :authorize, only: [:show, :edit, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def show
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
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
  end

private

  def set_user
  # use the :id to find one vampire in the database
  @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

end
