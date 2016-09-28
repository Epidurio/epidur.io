class CreateFollowUps < ActiveRecord::Migration[5.0]
  def change
    create_table :follow_ups do |t|
      t.integer :user_id
      t.integer :patient_id
      t.boolean :nausea
      t.boolean :itching
      t.boolean :headache
      t.boolean :leg_weakness
      t.boolean :leg_numbness
      t.boolean :back_pain
      t.boolean :urinary_rentention
      t.boolean :pain
      t.boolean :awareness_GA
      t.string :comments

      t.timestamps
    end
  end
end
