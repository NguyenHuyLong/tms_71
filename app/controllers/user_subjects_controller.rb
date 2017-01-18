class UserSubjectsController < ApplicationController
  before_action :logged_in_user
  before_action :find_user_course
  before_action :find_user_subject

  def show
    if @user_subject
      @supports = Supports::UserSubjectSupport.new @user_subject
    else
      flash[:danger] = t "flash.danger.subject_not_found"
      redirect_to user_courses_path
    end
  end

  def update
    if @user_subject.update_attributes status: Settings.finished
      flash[:success] = t "flash.success.finish_subject"
    else
      flash[:danger] = t "flash.danger.error"
    end
    redirect_to [@user_subject.user_course, @user_subject]
  end

  private
  def find_user_course
    @user_course = UserCourse.find_by id: params[:user_course_id]
    unless @user_course
      flash[:danger] = t "flash.danger.course_not_found"
      redirect_to courses_path
    end
  end

  def find_user_subject
    @user_subject = UserSubject.find_by id: params[:id]
    unless @user_subject
      flash[:danger] = t "flash.danger.subject_not_found"
      redirect_to @user_course
    end
  end
end
