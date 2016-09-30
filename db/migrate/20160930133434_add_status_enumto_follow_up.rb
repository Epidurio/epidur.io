class AddStatusEnumtoFollowUp < ActiveRecord::Migration[5.0]
  def change
    add_column :follow_ups, :status, :integer
  end
end
