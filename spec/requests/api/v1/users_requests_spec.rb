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

  it 'creates a user' do
    user_params = {
      name: 'Peter Pilsbury',
      bio: 'Capital P.',
      email: 'doughboy@aol.com',
      password_digest: 'l423789otgf3q4ijghlaisduk',
      location: 'Denver, CO'
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

    created_user = User.last

    expect(response).to be_successful
    expect(created_user.name).to eq(user_params[:name])
    expect(created_user.bio).to eq(user_params[:bio])
    expect(created_user.email).to eq(user_params[:email])
    expect(created_user.password_digest).to eq(user_params[:password_digest])
    expect(created_user.location).to eq(user_params[:location])
  end
end
