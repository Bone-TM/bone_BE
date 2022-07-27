class Pet < ApplicationRecord
  belongs_to :user
  has_many :matches

  validates_presence_of :name,
                        :age,
                        :weight,
                        :breed,
                        :bio,
                        :sex
end
