class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :DOB
      t.string :MRN
      t.string :NHS_No

      t.timestamps
    end
  end
end
