class FollowUp < ApplicationRecord
  enum status: {review: 0, discharge: 1}

  belongs_to :user
  belongs_to :patient
end
