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
    @pets_all = []

    if params[:breed]
      pets_breed = Pet.where("breed ILIKE '%#{params[:breed]}'")
      @pets_all << pets_breed
    end
    if params[:age]
      pets_age = Pet.where("age BETWEEN '#{params[:age][:min_age]}' AND '#{params[:age][:max_age]}'")
      @pets_all << pets_age
    end
    if params[:weight]
      pets_weight = Pet.where("weight BETWEEN '#{params[:weight][:min_weight]}' AND '#{params[:weight][:max_weight]}'")
      @pets_all << pets_weight
    end
    if params[:sex]
      pets_sex = Pet.where("sex = '#{params[:sex]}'")
      @pets_all << pets_sex
    end

    pets_final = @pets_all[0]
    if @pets_all.count > 1
      @pets_all.each do |pets|
        pets_final = pets_final & pets
      end
    end
    return pets_final
  end
end
