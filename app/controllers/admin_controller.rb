class AdminController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @formulars = FormularCreator.all   
    @users = User.all
  end

  def new_user
    @user = User.new
    @company = Company.new
  end
  
  def create_user
    @user = User.new(user_params)
    @user.save
    redirect_to admin_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
