class AddDateandTimetoFollowUps < ActiveRecord::Migration[5.0]
  def change
    add_column :follow_ups, :date_and_time, :datetime
  end
end
