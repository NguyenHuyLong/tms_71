class Supports::CourseSupport
  def initialize
  end

  def subjects
    @subjects ||= Subject.all
  end

  def trainees
    @trainees ||= User.trainee
  end

  def supervisors
    @supervisors ||= User.supervisor
  end
end
