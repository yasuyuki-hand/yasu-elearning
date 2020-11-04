class User < ApplicationRecord
  has_many :active_relationships, foreign_key: "follower_id",
                                  class_name: "Relationship",
                                  dependent: :destroy

  has_many :followed_users, through: :active_relationships, source: :followed

  has_many :passive_relationships, foreign_key: "followed_id",
                                     class_name: "Relationship",
                                     dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: { minimum: 2, maximum: 75 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  # validates :email, presence: true, length: { minimum: 5, maximum: 200 }

  has_secure_password # password and password confirmation is required
  validates :password, length: { minimum: 5 }

  has_many :lessons

  # has_many :categories

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def follow(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
