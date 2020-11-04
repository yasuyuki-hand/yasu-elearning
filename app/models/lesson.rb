class Lesson < ApplicationRecord
    belongs_to :category
    has_many :answers
    belongs_to :user
    # has_many :word
end
