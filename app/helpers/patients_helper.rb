module PatientsHelper
  def epi_wait_time(patient)
    patient.epidural_requests.last.date_and_time
  end
end
