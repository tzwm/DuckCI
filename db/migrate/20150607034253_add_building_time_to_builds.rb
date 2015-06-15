class AddBuildingTimeToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :building_time, :integer
    add_column :projects, :avg_building_time, :integer
    add_column :projects, :builds_count, :integer, default: 0
  end
end
