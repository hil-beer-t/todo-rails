class CreateTasks < ActiveRecord::Migration[6.1]
  def up
    create_table :tasks do |t|
      t.string :description, null: false
      t.date :due_date
      t.boolean :done, default: false, null: false

      t.timestamps
    end
  end

  def def down 
    drop_table :tasks
  end
end
