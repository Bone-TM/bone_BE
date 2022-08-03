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

    post "/api/v1/users/#{user.id}/pets", headers: headers, params: JSON.generate(pet_params)

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

  it 'sends a single pet info' do
    user = create(:user)
    create_list(:pet, 3, user_id: user.id)

    get "/api/v1/pets/#{Pet.first.id}"

    response_body = JSON.parse(response.body, symbolize_names: true)

    pet = response_body[:data]
    expect(pet).to have_key(:id)
    expect(pet).to have_key(:attributes)
    expect(pet[:attributes][:name]).to be_a(String)
    expect(pet[:attributes][:breed]).to be_a(String)
    expect(pet[:attributes][:sex]).to be_a(String)
    expect(pet[:attributes][:bio]).to be_a(String)
    expect(pet[:attributes][:weight]).to be_a(Integer)
    expect(pet[:attributes][:age]).to be_a(Integer)
    expect(pet[:attributes][:user_id]).to be_a(Integer)
  end

  it 'deletes a pet' do
    user = create(:user)
    create_list(:pet, 3, user_id: user.id)

    delete "/api/v1/pets/#{Pet.first.id}"
    pets = Pet.all

    expect(pets.count).to eq(2)
  end

  it 'delete request fails on bad id' do
    user = create(:user)
    create_list(:pet, 3, user_id: user.id)

    delete "/api/v1/pets/1234567"
    pets = Pet.all

    expect(pets.count).to eq(3)
    expect(response.status).to eq(404)
  end
  it 'updates pet info' do
    user = create(:user)
    create_list(:pet, 3, user_id: user.id)
    pet1 = Pet.first

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

    patch "/api/v1/pets/#{pet1.id}", headers: headers, params: JSON.generate(pet_params)
    response_body = JSON.parse(response.body, symbolize_names: true)

    pet = response_body[:data]
    expect(pet).to have_key(:id)
    expect(pet).to have_key(:attributes)
    expect(pet[:attributes][:name]).to eq('Macpet 43')
    expect(pet[:attributes][:breed]).to eq("We think you're gonna love this")
    expect(pet[:attributes][:sex]).to eq('female')
    expect(pet[:attributes][:bio]).to eq('Am dog')
    expect(pet[:attributes][:weight]).to eq(147)
    expect(pet[:attributes][:age]).to eq(10)
    expect(pet[:attributes][:user_id]).to eq(user.id)
  end

  it 'returns error for unknown pet id' do
    user = create(:user)
    create_list(:pet, 3, user_id: user.id)
    pet1 = Pet.first

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

    patch "/api/v1/pets/1342565", headers: headers, params: JSON.generate(pet: pet_params)


    expect(response.status).to eq(404)
    expect(pet1.name).to_not eq('Macpet 43')
  end
end
