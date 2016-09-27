class Patient < ApplicationRecord

  has_many :anaesthetics
  has_many :users, through: :anaesthetics

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
