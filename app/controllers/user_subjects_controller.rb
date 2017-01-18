class UserSubjectsController < ApplicationController
  before_action :logged_in_user

  def show
    @user_subject = UserSubject.find_by id: params[:id]
    if @user_subject
      @supports = Supports::UserSubjectSupport.new @user_subject
    else
      flash[:danger] = t "flash.danger.subject_not_found"
      redirect_to user_courses_path
    end
  end
end
