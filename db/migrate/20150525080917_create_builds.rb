class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.integer :project_id, null: false
      t.string :commit, null: false
      t.string :state, null: false
      t.text :output

      t.timestamps null: false
    end
  end
end
