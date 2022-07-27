require 'rails_helper'

RSpec.describe Pet do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :matches }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :weight }
    it { should validate_presence_of :breed }
    it { should validate_presence_of :bio }
    it { should validate_presence_of :sex }
  end
end
