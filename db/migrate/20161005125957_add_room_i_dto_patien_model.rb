class AddRoomIDtoPatienModel < ActiveRecord::Migration[5.0]
  def change
      add_column :patients, :room_number_id, :integer
  end
end
