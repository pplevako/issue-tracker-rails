require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  include_context 'request json'
  # TODO: add more specs and check json contents
  describe 'GET index' do

  end

  describe 'POST create' do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
    end

    context 'with valid attributes' do
      let(:post_request) { post :create, task: FactoryGirl.attributes_for(:task) }

      it 'creates task' do
        expect { post_request }.to change(Task, :count).by(1)
      end

      it 'responds with 201 status' do
        post_request
        expect(response.status).to eq(201)
      end
    end
  end
end
