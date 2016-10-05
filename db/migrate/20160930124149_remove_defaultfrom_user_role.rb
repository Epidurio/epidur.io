class RemoveDefaultfromUserRole < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :role, :integer, :default => nil
  end
end
