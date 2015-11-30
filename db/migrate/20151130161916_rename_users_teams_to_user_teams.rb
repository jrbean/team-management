class RenameUsersTeamsToUserTeams < ActiveRecord::Migration
  def change
    rename_table :users_teams, :user_teams
  end
end
