class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  has_one :activity, as: :action, dependent: :destroy
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  after_create :save_relationship

  def save_relationship
    create_activity(user_id: follower.id)
  end
end
