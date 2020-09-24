class ChangeTasksColumnNamePaymentToFinished < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :approved, :boolean, default: false
    add_column :tasks, :completed, :boolean, default: false
    remove_column :tasks, :payment
  end
end
