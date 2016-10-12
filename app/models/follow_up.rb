class FollowUp < ApplicationRecord
  enum status: {Review: 0, Discharge: 1}

  #accepts_nested_attributes_for :patient

  belongs_to :user
  belongs_to :patient
end
