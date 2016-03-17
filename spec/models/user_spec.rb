require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#add_regular_role' do
    let(:user) { FactoryGirl.create(:user) }

    it 'assigns default role' do
      user.add_regular_role(nil)

      expect(user.has_role? :customer).to be true
      expect(user.has_role? :developer).to be false
    end

    it 'assigns permitted role' do
      user.add_regular_role(:developer)

      expect(user.has_role? :customer).to be false
      expect(user.has_role? :developer).to be true
    end
  end
end
