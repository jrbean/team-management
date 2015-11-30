class ChangeStatusToBoolean < ActiveRecord::Migration
  def change
    change_column :progresses, :status, 'boolean USING CAST(status AS boolean)'
  end
end
