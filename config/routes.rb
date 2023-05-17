Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root "home#index"

  resources :categories, only: :index
  resources :users
  resources :doctors
  resources :appointments, only: [:create, :update, :edit]
  resource :profile
end
