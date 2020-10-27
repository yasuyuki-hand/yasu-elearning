class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :choices
      t.boolean :correct_ans, default: false, null: false
      t.references :word, foreign_key: true
      t.timestamps
    end
  end
end
