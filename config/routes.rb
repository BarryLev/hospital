Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "home#index"

  resources :categories, only: :index
  resources :doctors
  resource :profile, :user

end
