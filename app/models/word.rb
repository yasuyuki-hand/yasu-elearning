class Word < ApplicationRecord
    belongs_to :category
    validates :word, presence: true
    default_scope -> { order('created_at DESC') }
    has_many :choices
    accepts_nested_attributes_for :choices
end
