class CreateChecklists < ActiveRecord::Migration[5.0]
  def change
    create_table :checklists do |t|
      t.text :check
      t.true :array

      t.timestamps
    end
  end
end
