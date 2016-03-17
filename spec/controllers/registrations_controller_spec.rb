require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  include_context 'request json'

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST create' do
    # TODO: check response has roles
    it 'assigns permitted role' do
      post :create, user: FactoryGirl.attributes_for(:user, role: 'developer')

      created_user = User.last
      expect(created_user.has_role? :developer).to be true
    end

    it 'assigns default role' do
      post :create, user: FactoryGirl.attributes_for(:user)

      created_user = User.last
      expect(created_user.has_role? :customer).to be true
    end
  end
end
