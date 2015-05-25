class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false, unique: true
      t.string :uri, null: false
      t.string :branch, null: false, default: 'master'
      t.text :script

      t.timestamps null: false
    end
  end
end
