class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :team_lead, :boolean
  end
end
