class Student < ApplicationRecord
  before_save { self.email = email.downcase }

  # Validations
  validates :name, presence: true, length: { minimum: 5, maximum: 30 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }

  # Associations
  has_secure_password
end