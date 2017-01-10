class Supervisors::UsersController < ApplicationController
  before_action :logged_in_user, :verify_supervisor

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

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
