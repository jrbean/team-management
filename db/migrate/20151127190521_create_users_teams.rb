class CreateUsersTeams < ActiveRecord::Migration
  def change
    create_table :users_teams, id: false do |t|
      t.integer :user_id
      t.integer :team_id
    end

    add_index :users_teams, :user_id
    add_index :users_teams, :team_id
  end
end
