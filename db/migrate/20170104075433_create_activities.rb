class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.integer :object_id
      t.integer :object_status
      t.string :object_type
      
      t.timestamps
    end
  end
end
