class Category < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { maximum: 30 }
    has_many :lessons
    has_many :words, dependent: :destroy

end
