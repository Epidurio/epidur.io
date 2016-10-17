class FollowUp < ApplicationRecord
  



  belongs_to :user
  belongs_to :patient

  def update_status(status)
    self.patient.status = status
    self.patient.save
  end
end
