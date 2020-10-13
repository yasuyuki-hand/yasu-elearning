class User < ApplicationRecord

  validates :name, presence: true, length: { minimum: 2, maximum: 75 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  # validates :email, presence: true, length: { minimum: 5, maximum: 200 }

  has_secure_password # password and password confirmation is required
  validates :password, length: { minimum: 5 }
end
