class Supports::CourseSupport
  def initialize args = {}
    @course = args[:course]
  end

  def subjects
    @subjects ||= Subject.all
  end

  def subject_of_course
    @subjects ||= @course.subjects
  end

  def trainees
    @trainees ||= User.trainee
  end

  def trainee_of_course
    @trainees ||= @course.user.trainee
  end

  def supervisors
    @supervisors ||= User.supervisor
  end

  def supervisor_of_course
    @supervisors ||=  @course.user.supervisor
  end
end
