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
    it { should validate_presence_of :auth_token }
    it { should validate_uniqueness_of :auth_token }
    it { should validate_presence_of :location }
    it { should validate_presence_of :bio }
  end
end
