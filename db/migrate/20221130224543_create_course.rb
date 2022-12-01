class CreateCourse < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :city
      t.integer :tee_times

      t.timestamps
    end
  end
end
