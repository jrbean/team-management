class AddColumnsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :condition, :string
    add_column :tasks, :standard, :string
  end
end
