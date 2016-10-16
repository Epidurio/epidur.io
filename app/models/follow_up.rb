class FollowUp < ApplicationRecord
  enum status: {Review: 0, Discharge: 1}

  belongs_to :user
  belongs_to :patient
  belongs_to :checklist
end
