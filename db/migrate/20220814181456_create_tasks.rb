class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
