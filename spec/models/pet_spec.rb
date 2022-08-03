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
    pe1 = Pet.create(name: 'jeeve', sex: 'male', bio: 'woof', breed: 'husky', weight: 30, age: 5, user_id: us1.id)
    pe2 = Pet.create(name: 'cat', sex: 'male', bio: 'woof', breed: 'cocker-spaniel', weight: 25, age: 5, user_id: us1.id)
    pe3 = Pet.create(name: 'dog', sex: 'male', bio: 'woof', breed: 'husky', weight: 20, age: 4, user_id: us1.id)
    pe4 = Pet.create(name: 'cave', sex: 'male', bio: 'woof', breed: 'husky', weight: 15, age: 6, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'male', bio: 'woof', breed: 'poodle', weight: 10, age: 3, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'female', bio: 'woof', breed: 'husky', weight: 5, age: 3, user_id: us1.id)

    pets = Pet.search({:breed=>"husky"})

    expect(pets.count).to eq(4)
    pets.each do |pet|
      expect(pet.breed).to eq('husky')
    end
  end

  it 'search returns pets by min/max age' do

    us1 = User.create(name: 'steve', email: 'steve@beve.com', bio: 'dogs r kewl', location: 'denver')
    pe1 = Pet.create(name: 'jeeve', sex: 'male', bio: 'woof', breed: 'husky', weight: 30, age: 5, user_id: us1.id)
    pe2 = Pet.create(name: 'cat', sex: 'male', bio: 'woof', breed: 'cocker-spaniel', weight: 25, age: 5, user_id: us1.id)
    pe3 = Pet.create(name: 'dog', sex: 'male', bio: 'woof', breed: 'husky', weight: 20, age: 4, user_id: us1.id)
    pe4 = Pet.create(name: 'cave', sex: 'male', bio: 'woof', breed: 'husky', weight: 15, age: 6, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'male', bio: 'woof', breed: 'poodle', weight: 10, age: 3, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'female', bio: 'woof', breed: 'husky', weight: 5, age: 3, user_id: us1.id)

    pets = Pet.search({:min_age=>4, :max_age=>5})


    expect(pets.count).to eq(3)
    pets.each do |pet|
      expect(pet.age).to be >= 4
      expect(pet.age).to be <= 5
    end
  end

  it 'search returns pets by sex' do

    us1 = User.create(name: 'steve', email: 'steve@beve.com', bio: 'dogs r kewl', location: 'denver')
    pe1 = Pet.create(name: 'jeeve', sex: 'male', bio: 'woof', breed: 'husky', weight: 30, age: 5, user_id: us1.id)
    pe2 = Pet.create(name: 'cat', sex: 'male', bio: 'woof', breed: 'cocker-spaniel', weight: 25, age: 5, user_id: us1.id)
    pe3 = Pet.create(name: 'dog', sex: 'male', bio: 'woof', breed: 'husky', weight: 20, age: 4, user_id: us1.id)
    pe4 = Pet.create(name: 'cave', sex: 'male', bio: 'woof', breed: 'husky', weight: 15, age: 6, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'male', bio: 'woof', breed: 'poodle', weight: 10, age: 3, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'female', bio: 'woof', breed: 'husky', weight: 5, age: 3, user_id: us1.id)

    pets = Pet.search({:sex=>'male'})

    expect(pets.count).to eq(5)
    pets.each do |pet|
      expect(pet.sex).to eq("male")
    end
  end

  it 'search returns pets by min/max weight' do

    us1 = User.create(name: 'steve', email: 'steve@beve.com', bio: 'dogs r kewl', location: 'denver')
    pe1 = Pet.create(name: 'jeeve', sex: 'male', bio: 'woof', breed: 'husky', weight: 30, age: 5, user_id: us1.id)
    pe2 = Pet.create(name: 'cat', sex: 'male', bio: 'woof', breed: 'cocker-spaniel', weight: 25, age: 5, user_id: us1.id)
    pe3 = Pet.create(name: 'dog', sex: 'male', bio: 'woof', breed: 'husky', weight: 20, age: 4, user_id: us1.id)
    pe4 = Pet.create(name: 'cave', sex: 'male', bio: 'woof', breed: 'husky', weight: 15, age: 6, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'male', bio: 'woof', breed: 'poodle', weight: 10, age: 3, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'female', bio: 'woof', breed: 'husky', weight: 5, age: 3, user_id: us1.id)

    pets = Pet.search({:min_weight=>10, :max_weight=>20})

    expect(pets.count).to eq(3)
    pets.each do |pet|
      expect(pet.weight).to be >= 10
      expect(pet.weight).to be <= 20
    end
  end

  it 'search returns pets by multiple params' do

    us1 = User.create(name: 'steve', email: 'steve@beve.com', bio: 'dogs r kewl', location: 'denver')
    pe1 = Pet.create(name: 'jeeve', sex: 'male', bio: 'woof', breed: 'husky', weight: 30, age: 5, user_id: us1.id)
    pe2 = Pet.create(name: 'cat', sex: 'male', bio: 'woof', breed: 'cocker-spaniel', weight: 25, age: 5, user_id: us1.id)
    pe3 = Pet.create(name: 'dog', sex: 'male', bio: 'woof', breed: 'husky', weight: 20, age: 4, user_id: us1.id)
    pe4 = Pet.create(name: 'cave', sex: 'male', bio: 'woof', breed: 'husky', weight: 15, age: 6, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'male', bio: 'woof', breed: 'poodle', weight: 10, age: 3, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'female', bio: 'woof', breed: 'husky', weight: 5, age: 3, user_id: us1.id)

    pets = Pet.search({:min_weight=>10, :max_weight=>20, :sex=>'male', :min_age=>4, :max_age=>5, :breed=>'husky'})

    expect(pets.count).to eq(1)
    expect(pets.first.name).to eq('dog')
  end
end
