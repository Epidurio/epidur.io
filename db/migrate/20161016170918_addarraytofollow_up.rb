class AddarraytofollowUp < ActiveRecord::Migration[5.0]

    def change
      if column_exists? :follow_ups, :checklist
        remove_column :follow_ups, :checklist
      end
    end
  end
