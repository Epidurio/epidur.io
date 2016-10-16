class AddArraytoFollowUPs < ActiveRecord::Migration[5.0]
  def change
    add_column :follow_ups, :checklist, :string, array: true, default: '{}'
    
  end
end
