class RenameGolfcourses < ActiveRecord::Migration[5.2]
  def change
    rename_column :golfers, :golfcourses_id, :course_id
  end
end
