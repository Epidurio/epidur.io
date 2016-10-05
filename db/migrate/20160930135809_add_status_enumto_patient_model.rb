class AddStatusEnumtoPatientModel < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :status, :integer
  end
end
