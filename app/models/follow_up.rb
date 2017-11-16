class FollowUp < ApplicationRecord
#enum status: {Review: 0, Discharge: 1}
 enum discharge_type: {"review" => 0, "discharge" => 1}
  belongs_to :user, required: false
  belongs_to :patient, required: false
  belongs_to :checklist, required: false



  after_create :set_parent_to_pending, unless: Proc.new { self.discharge_type == "review" }


    def set_parent_to_pending
      # child should always have a parent, but we need to check just in case
      patient.update(status: :discharge)
    end
  

end
