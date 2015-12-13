class ChangeStatusToCompleted < ActiveRecord::Migration
  def change
    rename_column :progresses, :status, :complete
  end
end
