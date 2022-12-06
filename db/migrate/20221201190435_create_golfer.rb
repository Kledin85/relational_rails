class CreateGolfer < ActiveRecord::Migration[5.2]
  def change
    create_table :golfers do |t|
      t.string :name
      t.boolean :adult
      t.datetime :tee_time
      t.integer :courses_id

      t.timestamps
    end
  end
end
