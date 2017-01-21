class UserCoursesController < ApplicationController
  before_action :logged_in_user

  def show
    @user_course = UserCourse.find_by id: params[:id]
    if @user_course
      @user_subjects = @user_course.user_subjects
    else
      flash[:danger] = t "flash.danger.course_not_found"
      redirect_to courses_path
    end
  end
end
