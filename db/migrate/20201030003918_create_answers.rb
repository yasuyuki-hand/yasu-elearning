class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :word_id, foreign_key: true
      t.integer :choice_id, foreign_key: true
      t.integer :lesson_id, foreign_key: true

      t.timestamps
    end
    add_index :answers, [:word_id, :created_at]
    add_index :answers, [:choice_id, :created_at]
    add_index :answers, [:lesson_id, :created_at]
  end
end
