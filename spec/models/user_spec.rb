require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many :pets }
    it { should have_many(:matches).through :pets }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'class methods' do
    it '.find_by_email' do
      user1 = create(:user, email: 'pilson@gmail.com')
      user2 = create(:user, email: 'joeshvac@gmail.com')
      user3 = create(:user, email: 'williesbigrigs@gmail.com')
      user4 = create(:user, email: 'porkybob@gmail.com')

      expect(User.find_by_email('p')).to eq [user1]
      expect(User.find_by_email('po')).to eq [user4]
      expect(User.find_by_email('w')).to eq [user3]
      expect(User.find_by_email('J')).to eq [user2]
      expect(User.find_by_email('hvac')).to eq [user2]
      expect(User.find_by_email('s')).to eq [user2]
    end
  end
end
