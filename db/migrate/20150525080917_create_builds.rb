class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.integer :project_id, null: false
      t.string :commit
      t.string :state
      t.integer :exit_status
      t.text :stderr
      t.text :stdout

      t.timestamps null: false
    end
  end
end
