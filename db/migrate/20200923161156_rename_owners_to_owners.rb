class RenameOwnersToOwners < ActiveRecord::Migration[6.0]
  def change
    rename_column :houses, :Owner, :owner
  end
end
