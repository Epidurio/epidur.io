class AddInterventionIDtoAnaestheticModel < ActiveRecord::Migration[5.0]
  def change
    add_column :anaesthetics, :intervention_id, :integer
  end
end
