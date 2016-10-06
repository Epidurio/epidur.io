class Anaesthetic < ApplicationRecord
  belongs_to :user
  belongs_to :patient

  belongs_to :intervention
end
