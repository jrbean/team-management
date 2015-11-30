class AddColumnToUserTeam < ActiveRecord::Migration
  def change
    add_column :user_teams, :team_id, :integer
    add_column :user_teams, :user_id, :integer
  end
end
