require 'rails_helper'

RSpec.describe 'UserFindRequest' do
  describe 'happy path' do
    it 'returns one user based on search params' do
      user1 = create(:user, email: 'pilson@gmail.com')
      user2 = create(:user, email: 'joeshvac@gmail.com')
      user3 = create(:user, email: 'williesbigrigs@gmail.com')
      user4 = create(:user, email: 'porkybob@gmail.com')

      get api_v1_users_find_path, params: { email: 'P' }

      expect(response).to be_successful
      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_a(String)

      expect(user[:data][:attributes]).to have_key(:name)
      expect(user[:data][:attributes][:email]).to eq('pilson@gmail.com')
    end

    it 'raises a 400 error if there are no params' do
      get api_v1_users_find_path, params: { email: ''}

      expect(response.status).to eq(400)
    end
  end

  describe 'sad path' do
    it 'raises error when there is no match' do
      get api_v1_users_find_path, params: { email: 'X' }

      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:errors]).to eq("Could not find email that matched with X")
    end
  end
end
