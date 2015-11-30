class CreateProgress < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :task_id
      t.string :status
      t.datetime :due_at
    end
  end
end
