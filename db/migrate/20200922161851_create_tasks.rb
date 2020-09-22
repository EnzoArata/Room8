class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string "title"
      t.text "description"
      t.datetime "created_at"
      t.datetime "startDate"
      t.datetime "dueDate"
      t.integer "assignedUser"
      t.integer "createdBy"
      t.boolean "payment"
    end
  end
end
