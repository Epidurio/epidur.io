class CreateRoomAllocations < ActiveRecord::Migration[5.0]
  def change
    create_table :room_allocations do |t|
      t.integer :patient_id
      t.integer :room_id

      t.timestamps
    end
  end
end
