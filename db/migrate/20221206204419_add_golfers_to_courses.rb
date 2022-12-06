class AddGolfersToCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :golfers, :course, foreign_key: true, null: false
  end
end
