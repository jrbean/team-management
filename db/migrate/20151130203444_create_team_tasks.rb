class CreateTeamTasks < ActiveRecord::Migration
  def change
    create_table :team_tasks do |t|

      t.timestamps null: false
    end
  end
end
