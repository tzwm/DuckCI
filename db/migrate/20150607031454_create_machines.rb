class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :login_user, null: false
      t.string :state, index: true

      t.timestamps null: false
    end
  end
end
