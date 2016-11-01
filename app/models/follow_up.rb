class FollowUp < ApplicationRecord

  belongs_to :user, required: false
  belongs_to :patient, required: false

  def update_status(status)
    self.patient.status = status
    self.patient.save
  end
end
