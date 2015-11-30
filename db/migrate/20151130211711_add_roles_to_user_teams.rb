class AddRolesToUserTeams < ActiveRecord::Migration
  def change
    add_column :user_teams, :role, :string, default: "user"
  end
end
