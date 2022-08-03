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
    pets_final = []

    if params[:breed]
      pets_breed = Pet.where("breed ILIKE '%#{params[:breed]}'")
      @pets_all << pets_breed
    end
    if params[:min_age]
      pets_min_age = Pet.where("age >= '#{params[:min_age]}'")
      @pets_all << pets_min_age
    end
    if params[:max_age]
      pets_max_age = Pet.where("age <= '#{params[:max_age]}'")
      @pets_all << pets_max_age
    end
    if params[:min_weight]
      pets_min_weight = Pet.where("weight >= '#{params[:min_weight]}'")
      @pets_all << pets_min_weight
    end
    if params[:max_weight]
      pets_max_weight = Pet.where("weight <= '#{params[:max_weight]}'")
      @pets_all << pets_max_weight
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
