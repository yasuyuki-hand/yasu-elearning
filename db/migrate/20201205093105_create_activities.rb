class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.belongs_to :action, polymorphic: true
      
      t.timestamps
    end
    add_index :activities, [:user_id, :created_at]
    add_index :activities, [:action_id, :action_type]
  end
end
