Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root "home#index"

  resources :categories, only: :index
  resources :users, only: :show
  resources :doctors
  resource :profile

end
