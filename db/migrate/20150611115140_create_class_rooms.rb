class CreateClassRooms < ActiveRecord::Migration
  def change
    create_table :class_rooms do |t|
      t.integer :student_id
      t.integer :course_id
      t.datetime :entry_at
      t.timestamps
    end
  end
end
