class UserCoursesController < ApplicationController
  before_action :logged_in_user

  def show
    @course = UserCourse.find_by id: params[:id]
    if @course
      @user_subjects = @course.user_subjects
    else
      flash[:danger] = t "flash.danger.course_not_found"
      redirect_to user_courses_path
    end
  end
end
