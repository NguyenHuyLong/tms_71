class UsersController < ApplicationController
  def new
    @user = User.new
  end
      
  def create
    @user = User.new user_params
    if @user.save
      redirect_to new_user_path, notice: t(:the_user_inserted, username: @user.name)
    else
      render :new
    end  
  end
   
  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
