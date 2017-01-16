class UserCoursesController < ApplicationController
  before_action :logged_in_user

  def index
    @user_courses = current_user.user_courses.page params[:page]
  end

  def show
    @course = UserCourse.find_by id: params[:id]
    @user_subjects = @course.user_subjects
  end
end
