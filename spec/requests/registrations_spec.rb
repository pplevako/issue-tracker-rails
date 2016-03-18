require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  include_context 'json headers'
  describe 'POST /users' do
    it 'responds with correct user data' do
      post user_registration_path, { user: FactoryGirl.attributes_for(:user, role: 'developer') }, json_headers

      expect(response.body).to include_json(roles:['developer'])
      expect(response).to have_http_status(200)
    end
  end
end
