class RemoveStatusFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :status, :integer
  end
end
