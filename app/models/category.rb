class Category < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { maximum: 30 }
    belongs_to :lesson, optional: true
end
