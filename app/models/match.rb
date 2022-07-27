class Match < ApplicationRecord
  belongs_to :pet
  # belongs_to :user

  validates_presence_of :pet_id,
                       :matched_pet_id
end
