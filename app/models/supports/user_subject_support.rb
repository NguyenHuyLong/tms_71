class Supports::UserSubjectSupport
  def initialize user_subject
    @user_subject = user_subject
  end

  def tasks
    @tasks ||= @user_subject.subject.tasks
  end

  def new_user_task
    @new_user_task = UserTask.new
  end
end
