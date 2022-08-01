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

  it 'search returns pets by search criteria' do

    us1 = User.create(name: 'steve', email: 'steve@beve.com', bio: 'dogs r kewl', location: 'denver')
    pe1 = Pet.create(name: 'jeeve', sex: 'male', bio: 'woof', breed: 'husky', weight: 19, age: 5, user_id: us1.id)
    pe2 = Pet.create(name: 'cat', sex: 'male', bio: 'woof', breed: 'cocker-spaniel', weight: 19, age: 5, user_id: us1.id)
    pe3 = Pet.create(name: 'dog', sex: 'male', bio: 'woof', breed: 'husky', weight: 19, age: 5, user_id: us1.id)
    pe4 = Pet.create(name: 'cave', sex: 'male', bio: 'woof', breed: 'cocker-spaniel', weight: 19, age: 5, user_id: us1.id)
    pe5 = Pet.create(name: 'arm', sex: 'male', bio: 'woof', breed: 'cocker-spaniel', weight: 19, age: 5, user_id: us1.id)

    pets = Pet.search({:breed=>"husky"})

    expect(pets.count).to eq(2)
    expect(pets.first.name).to eq('jeeve')
    expect(pets.last.name).to eq('dog')

  end
end
