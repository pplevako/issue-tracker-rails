Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}

  resources :tasks, only: [:index, :show, :create, :update]
end
