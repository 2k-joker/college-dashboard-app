class Course < ApplicationRecord
  # Validations
  validates :course_code, presence: true, uniqueness: { ignore_case: false },
    length: { minimum: 3, maximum: 10 }
  validates :name, presence: true, length: { minimum: 10, maximum: 200 }
  validates :description, presence: true, length: { minimum: 25 }

  # Associations
  has_many :students_courses
  has_many :students, through: :students_courses
end
