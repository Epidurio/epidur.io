class AddArrayTypetoFollowUp < ActiveRecord::Migration[5.0]
  def change
    remove_column :follow_ups, :checklist

  end
end
