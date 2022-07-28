require 'rails_helper'

RSpec.describe 'The users API' do
  it 'sends a list of all users' do
    create_list(:user, 3)

    get '/api/v1/users'

    response_body = JSON.parse(response.body, symbolize_names: true)

    users = response_body[:data]

    expect(response).to be_successful
    expect(users.count).to eq(3)

    users.each do |user|
      expect(user).to have_key(:id)

      expect(user).to have_key(:attributes)
      expect(user[:attributes][:name]).to be_a(String)
      expect(user[:attributes][:bio]).to be_a(String)
      expect(user[:attributes][:email]).to be_a(String)
      expect(user[:attributes][:password_digest]).to be_a(String)
      expect(user[:attributes][:location]).to be_a(String)
    end
  end

  it 'can send a list of a specified users information' do
    user = create(:user)
    pet1 = create(:pet, user_id: user.id)
    pet2 = create(:pet, user_id: user.id)
    pet3 = create(:pet, user_id: user.id)

    expect(user.pets.count).to eq 3

    get api_v1_user_path(user.id)

    response_body = JSON.parse(response.body, symbolize_names: true)

    parsed_user = response_body[:data]

    expect(response).to be_successful

    expect(parsed_user).to have_key(:attributes)
    expect(parsed_user[:attributes][:name]).to eq user.name
    expect(parsed_user[:attributes][:bio]).to eq user.bio
    expect(parsed_user[:attributes][:email]).to eq user.email
    expect(parsed_user[:attributes][:password_digest]).to eq user.password_digest
    expect(parsed_user[:attributes][:location]).to eq user.location
    expect(parsed_user[:attributes][:pets].count).to eq 3
    expect(parsed_user[:attributes][:pets][0][:name]).to eq pet1.name
    expect(parsed_user[:attributes][:pets][1][:name]).to eq pet2.name
    expect(parsed_user[:attributes][:pets][2][:name]).to eq pet3.name
  end
end
