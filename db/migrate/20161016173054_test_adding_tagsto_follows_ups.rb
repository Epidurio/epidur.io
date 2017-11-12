class TestAddingTagstoFollowsUps < ActiveRecord::Migration[5.0]
  def change
    add_column :follow_ups, :tags, :text, array: true, default: []
  end
end
