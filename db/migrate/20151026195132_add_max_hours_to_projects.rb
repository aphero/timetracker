class AddMaxHoursToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :max_hours, :integer
  end
end
