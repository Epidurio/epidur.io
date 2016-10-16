class Switchtostringfromtext < ActiveRecord::Migration[5.0]
    def self.up
      change_table :follow_ups do |t|
        t.change :checklist, :string, array: true
      end
    end
    def self.down
      change_table :follow_ups do |t|
        t.change :checklist, :text
      end
    end

end
