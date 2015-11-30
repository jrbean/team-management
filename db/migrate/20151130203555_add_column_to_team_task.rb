class AddColumnToTeamTask < ActiveRecord::Migration
  def change
    add_column :team_tasks, :team_id, :integer
    add_column :team_tasks, :task_id, :integer
  end
end
