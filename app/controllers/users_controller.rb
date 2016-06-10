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
      flash[:success] = 'You have successfully created an account!'
      redirect_to images_path
    else
      flash[:danger] = 'Error creating account. Ensure all information '
      redirect_to :back
    end
  end

  def update
    if @user.update(user_params)
      redirect_to images_path
    else
      flash[:danger] = 'You must enter your password in order to edit your account'
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user.destroy
      redirect_to images_path
  end

private

  def set_user
  @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

end
