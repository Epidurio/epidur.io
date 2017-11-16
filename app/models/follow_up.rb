class FollowUp < ApplicationRecord
#enum status: {Review: 0, Discharge: 1}
 enum discharge_type: {"review" => 0, "discharge" => 1}
  belongs_to :user, required: false
  belongs_to :patient, required: false
  belongs_to :checklist, required: false



  before_save :set_patient_to_discharge, if: Proc.new { self.discharge_type == "discharge" }
  before_save :set_patient_to_pending, if: Proc.new { self.discharge_type == "review" }

  def set_patient_to_discharge

    patient.update(status: :discharge)
  end


  def set_patient_to_pending

    patient.update(status: :pending)
  end


end
