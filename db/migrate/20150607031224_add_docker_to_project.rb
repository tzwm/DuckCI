class AddDockerToProject < ActiveRecord::Migration
  def change
    add_column :projects, :dockerfile, :text
    add_column :projects, :docker_uri, :string
  end
end
