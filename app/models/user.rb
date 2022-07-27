class User < ApplicationRecord
  has_many :pets
  has_many :matches, through: :pets

  validates_presence_of :name,
                        :email,
                        :password_digest,
                        :location,
                        :bio

  validates_uniqueness_of :email
end
