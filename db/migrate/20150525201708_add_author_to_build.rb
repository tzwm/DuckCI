class AddAuthorToBuild < ActiveRecord::Migration
  def change
    add_column :builds, :author, :string
  end
end
