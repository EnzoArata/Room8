class AddHouseidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :house_id, :integer
  end
end
