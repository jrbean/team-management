class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.references :task, index: true, foreign_key: true
      t.string :family
      t.json :args

      t.timestamps null: false
    end
  end
end
