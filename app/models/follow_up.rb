class FollowUp < ApplicationRecord
  enum status: {Review: 0, Discharge: 1}

  belongs_to :user
  belongs_to :patient

  def update_status(status)
    self.patient.status = status
    self.patient.save
  end
end
