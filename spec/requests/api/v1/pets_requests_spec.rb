require 'rails_helper'

RSpec.describe 'The pets API' do
  it 'sends a list of all pets' do
    user = create(:user)
    create_list(:pet, 3, user_id: user.id)

    get '/api/v1/pets'

    response_body = JSON.parse(response.body, symbolize_names: true)

    pets = response_body[:data]

    expect(response).to be_successful
    expect(pets.count).to eq(3)

    pets.each do |pets|
      expect(pets).to have_key(:id)

      expect(pets).to have_key(:attributes)
      expect(pets[:attributes][:name]).to be_a(String)
      expect(pets[:attributes][:breed]).to be_a(String)
      expect(pets[:attributes][:sex]).to be_a(String)
      expect(pets[:attributes][:bio]).to be_a(String)
      expect(pets[:attributes][:weight]).to be_a(Integer)
      expect(pets[:attributes][:age]).to be_a(Integer)
      expect(pets[:attributes][:user_id]).to be_a(Integer)
    end
  end

  it 'creates an pet' do
    user = create(:user)

    pet_params = {
      name: 'Macpet 43',
      breed: "We think you're gonna love this",
      sex: 'female',
      bio: 'Am dog',
      weight: 147,
      age: 10,
      user_id: user.id
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/pets', headers: headers, params: JSON.generate(pet: pet_params)

    created_pet = Pet.last

    expect(response).to be_successful
    expect(created_pet.name).to eq(pet_params[:name])
    expect(created_pet.breed).to eq(pet_params[:breed])
    expect(created_pet.sex).to eq(pet_params[:sex])
    expect(created_pet.bio).to eq(pet_params[:bio])
    expect(created_pet.weight).to eq(pet_params[:weight])
    expect(created_pet.age).to eq(pet_params[:age])
    expect(created_pet.user_id).to eq(pet_params[:user_id])
  end
end
