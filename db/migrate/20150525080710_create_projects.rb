class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :uri, null: false
      t.string :branch, null: false, default: 'master'

      t.timestamps null: false
    end
  end
end
