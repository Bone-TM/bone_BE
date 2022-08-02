require 'rails_helper'

RSpec.describe Pet do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :matches }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :weight }
    it { should validate_presence_of :breed }
    it { should validate_presence_of :bio }
    it { should validate_presence_of :sex }
  end

  it 'search returns pets by breed search criteria' do

    us1 = User.create(name: 'steve', email: 'steve@beve.com', bio: 'dogs r kewl', location: 'denver')
    pe1 = Pet.create(name: 'jeeve', sex: 'male', bio: 'woof', breed: 'husky', weight: 19, age: 5, user_id: us1.id)
    pe2 = Pet.create(name: 'cat', sex: 'male', bio: 'woof', breed: 'cocker-spaniel', weight: 19, age: 5, user_id: us1.id)
    pe3 = Pet.create(name: 'dog', sex: 'male', bio: 'woof', breed: 'husky', weight: 19, age: 4, user_id: us1.id)
    pe4 = Pet.create(name: 'cave', sex: 'male', bio: 'woof', breed: 'husky', weight: 19, age: 6, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'male', bio: 'woof', breed: 'poodle', weight: 19, age: 3, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'male', bio: 'woof', breed: 'husky', weight: 19, age: 3, user_id: us1.id)

    pets = Pet.search({:breed=>"husky"})
    binding.pry

    expect(pets.count).to eq(4)
    pets.each do |pet|
      expect(pet.breed).to eq('husky')
    end

  end

  it 'search returns pets by min/max age' do

    us1 = User.create(name: 'steve', email: 'steve@beve.com', bio: 'dogs r kewl', location: 'denver')
    pe1 = Pet.create(name: 'jeeve', sex: 'male', bio: 'woof', breed: 'husky', weight: 19, age: 5, user_id: us1.id)
    pe2 = Pet.create(name: 'cat', sex: 'male', bio: 'woof', breed: 'cocker-spaniel', weight: 19, age: 5, user_id: us1.id)
    pe3 = Pet.create(name: 'dog', sex: 'male', bio: 'woof', breed: 'husky', weight: 19, age: 4, user_id: us1.id)
    pe4 = Pet.create(name: 'cave', sex: 'male', bio: 'woof', breed: 'husky', weight: 19, age: 6, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'male', bio: 'woof', breed: 'poodle', weight: 19, age: 3, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'male', bio: 'woof', breed: 'husky', weight: 19, age: 3, user_id: us1.id)

    pets = Pet.search({:age=>{:min_age=>4, :max_age=>5}})


    expect(pets.count).to eq(2)
    pets.each do |pet|
      expect(pet.age).to be_greater_than(3)
      expect(pet.age).to be_less_than(6)
    end

  end
end
