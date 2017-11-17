class EpiduralRequest < ApplicationRecord

  enum status: {"pending" => 0, "complete" => 1}
   belongs_to :user, required: false
   belongs_to :patient, required: false
   
end
