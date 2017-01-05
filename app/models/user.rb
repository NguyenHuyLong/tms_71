class User < ApplicationRecord
  has_many :activities, dependent: :destroy
  has_many :user_courses
  has_many :courses, through: :user_courses
  has_many :user_subjects
  has_many :subjects, through: :user_subjects
  has_many :user_tasks
  has_many :tasks, through: :user_tasks	
end
