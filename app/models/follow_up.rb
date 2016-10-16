class FollowUp < ApplicationRecord
  enum status: {Review: 0, Discharge: 1}

  #serialize :checklist

  belongs_to :user
  belongs_to :patient
end
