class CreateAnaesthetics < ActiveRecord::Migration[5.0]
  def change
    create_table :anaesthetics do |t|
      t.integer :user_id
      t.integer :patient_id
      t.datetime :date_and_time
      t.string :intervention
      t.string :indication
      t.integer :no_attempts
      t.string :complications

      t.timestamps
    end
  end
end
