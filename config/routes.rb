Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # devise_for :doctors, controllers: {
  #   sessions: 'doctors/sessions',
  #   registrations: 'doctors/registrations'    
  # }
  # devise_for :admins, controllers: {
  #   sessions: 'admins/sessions',
  #   registrations: 'admins/registrations'    
  # }
  root "home#index"

  resources :categories, only: :index
  resources :doctors
end
