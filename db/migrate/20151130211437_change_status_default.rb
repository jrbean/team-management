class ChangeStatusDefault < ActiveRecord::Migration
  def change
    change_column :progresses, :status, :boolean, null: false, default: false
  end
end
