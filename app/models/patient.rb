class Patient < ApplicationRecord
  enum status: {review: 0, discharge: 1, pending: 3}

  has_one :room_allocation
  has_one :room, through: :room_allocation


  has_many :anaesthetics
  has_many :users, through: :anaesthetics

  has_many :follow_ups
  has_many :users, through: :follow_ups

  has_many :epidural_requests
  has_many :users, through: :epidural_requests

  # Getter
  def full_name
    [first_name, last_name].join(' ')
  end

  # Setter
  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end
end
