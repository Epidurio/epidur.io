class AddArraytype < ActiveRecord::Migration[5.0]
  def change
    add_column :follow_ups, :checklist, :text, array: true
  end
end
