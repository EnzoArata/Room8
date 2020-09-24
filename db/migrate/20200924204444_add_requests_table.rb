class AddRequestsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer "requestor_id"
    end
  end
end
