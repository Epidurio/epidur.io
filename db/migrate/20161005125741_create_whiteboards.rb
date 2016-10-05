class CreateWhiteboards < ActiveRecord::Migration[5.0]
  def change
    create_table :whiteboards do |t|
      t.integer :room_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
