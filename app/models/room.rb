class Room < ApplicationRecord

  has_one :room_allocation
  has_one :patient, through: :room_allocation
end
