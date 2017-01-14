class CoursesController < ApplicationController
  before_action :logged_in_user
  before_action :find_course
  before_action :valid_course

  def show
    @subjects = @course.subjects
  end

  private
  def find_course
    @course = Course.find_by id: params[:id]
    if @course.nil?
      flash[:danger] = t "flash.course_not_exist"
      redirect_to current_user
    end
  end

  def valid_user
    unless current_user.courses.include? @course
      flash[:danger] = t "flash.danger.cannot_view_course"
      redirect_to current_user
    end
  end
end
