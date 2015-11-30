class CreateCondition < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.references :team_task, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
