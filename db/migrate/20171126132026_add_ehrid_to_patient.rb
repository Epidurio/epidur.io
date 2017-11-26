class AddEhridToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :ehr_id, :string
  end
end
