require 'rails_helper'

RSpec.describe Match do
  describe 'relationships' do
    it { should belong_to :pet }
    # it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of :pet_id }
    it { should validate_presence_of :matched_pet_id }
  end
end
