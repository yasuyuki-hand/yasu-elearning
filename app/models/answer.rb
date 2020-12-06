class Answer < ApplicationRecord
    belongs_to :word
    belongs_to :choice
    belongs_to :lesson

    default_scope -> { order(created_at: :desc) }
end
