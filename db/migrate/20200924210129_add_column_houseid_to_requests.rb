class AddColumnHouseidToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :house_id, :integer
  end
end
