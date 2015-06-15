class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, null: false, default: "normal"
    add_index :users, :role
  end
end
