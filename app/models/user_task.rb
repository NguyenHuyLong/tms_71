class UserTask < ApplicationRecord
  belongs_to :task 
  belongs_to :user_subject
  belongs_to :user 

  enum status: {progress: 0, finished: 1}
end
