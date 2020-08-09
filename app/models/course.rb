class Course < ApplicationRecord
  # Validations
  validates :course_code, presence: true, uniqueness: { ignore_case: false },
    length: { minimum: 3, maximum: 10 }
  validates :name, presence: true, length: { minimum: 10, maximum: 200 }
  validates :description, presence: true, length: { minimum: 25 }
end
