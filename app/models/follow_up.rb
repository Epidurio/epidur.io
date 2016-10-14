class FollowUp < ApplicationRecord

  #before_create :checkstatus


  belongs_to :user
  belongs_to :patient


  def update_status(status)
    self.patient.status = status
    self.patient.save
  end



  protected


  #def checkstatus
  #  patient = Patient.find_by_id(patient_id)
  #  patient.discharge!


#  end
end
