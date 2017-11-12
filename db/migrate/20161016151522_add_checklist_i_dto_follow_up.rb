class AddChecklistIDtoFollowUp < ActiveRecord::Migration[5.0]
  def change
    add_column :follow_ups, :checklist_id, :integer
  end
end
