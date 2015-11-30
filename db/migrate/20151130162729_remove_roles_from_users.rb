class RemoveRolesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin, :boolean
    remove_column :users, :team_lead, :boolean
  end
end
