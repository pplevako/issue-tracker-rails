require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  include_context 'request json'
  let(:user) { FactoryGirl.create(:user, :customer) }

  before do
    sign_in user
  end

  # TODO: add more specs
  describe 'GET index' do
    before do
      get :index
    end

    it { is_expected.to respond_with(:ok) }
  end

  describe 'POST create' do
    context 'with valid attributes' do
      let(:post_request) { post :create, task: FactoryGirl.attributes_for(:task) }

      it 'creates task' do
        expect { post_request }.to change(Task, :count).by(1)
      end

      it 'responds with 201 status' do
        post_request
        is_expected.to respond_with(201)
      end
    end
  end

  describe 'PATCH update' do

  end
end
