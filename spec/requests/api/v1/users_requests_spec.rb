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
end
