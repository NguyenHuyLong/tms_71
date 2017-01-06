class Subject < ApplicationRecord
  has_many :course_subjects
  has_many :course, through: :course_subjects
  has_many :tasks, dependent: :destroy, inverse_of: :subject
  has_many :user_subjects
  has_many :users, through: :user_subjects

  validates :name, presence: true
  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: -> tasks {tasks["name"].blank?}
end
