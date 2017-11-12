class AddDischargeTypetoFollowUps < ActiveRecord::Migration[5.0]
  def change
    add_column :follow_ups, :discharge_type, :integer
  end
end
