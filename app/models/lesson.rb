class Lesson < ApplicationRecord
    belongs_to :category
    has_many :answers
    belongs_to :user
    has_many :words, through: :answers
    has_one :activity, as: :action, dependent: :destroy
    # has_many :word
end
