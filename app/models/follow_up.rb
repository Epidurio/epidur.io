class FollowUp < ApplicationRecord

  #before_create :checkstatus


  belongs_to :user
  belongs_to :patient

  protected

  #def checkstatus
  #  patient = Patient.find_by_id(patient_id)
  #  patient.discharge!


#  end
end
