class Choice < ApplicationRecord
  belongs_to :word
  has_many :answers
  default_scope -> { order(created_at: :desc) }
  validates :choices, presence: true, length: { maximum: 140 }
end
