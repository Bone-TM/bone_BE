require 'rails_helper'

RSpec.describe 'The petss API' do
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
end
