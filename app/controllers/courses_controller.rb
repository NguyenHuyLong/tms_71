class CoursesController < ApplicationController
  before_action :logged_in_user

  def index
    @user_courses = current_user.user_courses.page params[:page]
  end
end
