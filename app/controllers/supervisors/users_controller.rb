class Supervisors::UsersController < ApplicationController
  before_action :logged_in_user, :verify_supervisor
  before_action :find_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order(created_at: :desc).
      paginate page: params[:page], per_page: Settings.per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:info] = t :the_user_inserted, username: @user.name
      redirect_to supervisors_users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "flash.profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "flash.delete.delete_user"
    redirect_to supervisors_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "flash.user_not_exist"
      redirect_to supervisors_user_path
    end
  end
end
