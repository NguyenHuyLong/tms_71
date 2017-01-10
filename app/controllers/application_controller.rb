class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "please_login"
      redirect_to login_url
    end
  end

  def verify_supervisor
    unless current_user.supervisor?
      flash[:danger] = t "flash.danger.not_supervisor"
      redirect_to root_path
    end
  end
end
