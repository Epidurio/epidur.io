class AddFieldstoEpiduralRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :epidural_requests, :status, :integer
    add_column :epidural_requests, :history, :string
    add_column :epidural_requests, :cannula, :boolean
    add_column :epidural_requests, :anticoagulants, :boolean
    add_column :epidural_requests, :pyrexia, :boolean
    add_column :epidural_requests, :hypertension, :boolean
    add_column :epidural_requests, :platelets, :string
    add_column :epidural_requests, :date_and_time, :datetime
    add_column :epidural_requests, :user_id, :integer
    add_column :epidural_requests, :patient_id, :integer




  end
end
