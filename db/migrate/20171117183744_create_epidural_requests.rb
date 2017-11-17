class CreateEpiduralRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :epidural_requests do |t|

      t.timestamps
    end
  end
end
