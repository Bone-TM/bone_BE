class Pet < ApplicationRecord
  belongs_to :user
  has_many :matches

  validates_presence_of :name,
                        :age,
                        :weight,
                        :breed,
                        :bio,
                        :sex

  def self.search(params)
    if params[:breed]
      pets = Pet.where("breed ILIKE '%#{params[:breed]}'")
    end
  end
end
