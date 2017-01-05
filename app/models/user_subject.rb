class UserSubject < ApplicationRecord
  belongs_to :subject 
  belongs_to :user_course
  belongs_to :user 

  has_many :user_tasks, dependent: :destroy

  enum status: {pending: 0, progress: 1, finished: 2}
end
