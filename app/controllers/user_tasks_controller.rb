class UserTasksController < ApplicationController
  before_action :logged_in_user
  before_action :find_user_subject

  def create
    @user_task = current_user.user_tasks.new user_task_params
    @user_task.status = Settings.finished

    if @user_task.save
      flash[:success] = t "flash.success.finish_task"
    else
      flash[:danger] = t "flash.danger.error"
    end
    redirect_to [@user_subject.user_course, @user_subject]
  end

  private
  def user_task_params
    params.require(:user_task).permit :user_id, :user_subject_id, :task_id,
      :status
  end

  def find_user_subject
    @user_subject = UserSubject.find_by id: user_task_params[:user_subject_id]
    unless @user_subject
      flash[:danger] = t "flash.danger.subject_not_found"
      redirect_to [@user_subject.user_course, @user_subject]
    end
  end
end
