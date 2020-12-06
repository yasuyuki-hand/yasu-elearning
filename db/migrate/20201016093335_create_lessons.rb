class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :category_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.boolean :is_completed, default: false
      t.integer :result
      t.integer :count
      t.timestamps
    end
    add_index :lessons, [:user_id, :created_at]
    add_index :lessons, [:category_id, :created_at]
  end
end
