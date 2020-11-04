class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :word
      t.references :category, foreign_key: true
      t.references :lesson, foreign_key: true
      t.timestamps
    end
  end
end
