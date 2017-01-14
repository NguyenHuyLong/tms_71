class SubjectsController < ApplicationController
  before_action :logged_in_user
  before_action :find_subject

  def show
    @tasks = @subject.tasks
  end

  private
  def find_subject
    @subject = Subject.find_by id: params[:id]
    if @subject.nil?
      flash[:danger] = t "flash.existed_subject"
      redirect_to root_path
    end
  end
end
