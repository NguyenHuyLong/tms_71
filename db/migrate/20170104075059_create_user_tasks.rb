class CreateUserTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tasks do |t|
      t.references :user, foreign_key: true
      t.references :user_subject, foreign_key: true
      t.references :task, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
