class RemoveDefaultfromarrayInFollowUp < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:follow_ups, :checklist, nil)
  end
end
