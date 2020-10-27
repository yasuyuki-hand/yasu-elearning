class Choice < ApplicationRecord
  belongs_to :word
  validates :choices, presence: true
end
