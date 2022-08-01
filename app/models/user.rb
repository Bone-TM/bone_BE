class User < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :matches, through: :pets

  validates_presence_of :name,
                        :email

  validates_uniqueness_of :email

  def self.find_by_email(email)
    where('email ILIKE ?', "%#{email}%")
      .order(:email)
      .limit(1)
  end
end
