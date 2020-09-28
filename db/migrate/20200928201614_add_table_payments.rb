class AddTablePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string "title"
      t.float "amount"
      t.datetime "created_at"
      t.datetime "startDate"
      t.datetime "dueDate"
      t.integer "assignedUser"
      t.integer "createdBy"
      t.integer "house_id"
      t.boolean "approved", default: false
      t.boolean "completed", default: false
      t.boolean "recurring", default: false
      t.integer "occurences", default: 0
    end
  end
end
