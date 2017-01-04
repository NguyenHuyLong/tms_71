class Subject < ApplicationRecord
  has_many :course_subjects
  has_many :course, through: :course_subjects
  has_many :tasks
  has_many :user_subjects
  has_many :users, through: :user_subjects
end
