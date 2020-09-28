class UpdateTableTasksAddColumnRecurring < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :recurring, :boolean, default: false
    add_column :tasks, :occurences, :integer, default: false
  end
end
