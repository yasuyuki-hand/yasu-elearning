class Category < ApplicationRecord
    has_many :lessons
    has_many :words, dependent: :destroy

    validates :title, presence: true, length: { maximum: 50 },
    uniqueness: { case_sensitive: false }
    validates :description, presence: true, length: { maximum: 255 },
    uniqueness: { case_sensitive: false }
end
