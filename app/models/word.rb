class Word < ApplicationRecord
    belongs_to :category
    validates :word, presence: true, length: { minimum: 2 }
    # validates :choice, presence: true
    default_scope -> { order('created_at DESC') }
    has_many :choices
    accepts_nested_attributes_for :choices
    validate :unique
    validate :must_have_one_item

    def unique
        # 2つ以上同じchoiceにした場合にエラ
        duplicate_values = choices.uniq { |choice| choice.choices }.length
        # unique メソッド lengthメソッド
        
        # 1. apple 2. orange 3. grape
        if duplicate_values < choices.length
            errors.add(:choices ,"Must have unique choice")
        end

    end

    private
    def must_have_one_item
        # チェックを2つ以上つけた場合エラ-
        correct_counter = choices.map{|choice| choice.correct_ans }.count(true)
        # collectメソッド　map メソッド
        if correct_counter > 1
            errors.add(:choice ,"Must have unique choice")
        elsif correct_counter == 0
            errors.add(:choice ,"Must have unique choice")
        end
    end
end
