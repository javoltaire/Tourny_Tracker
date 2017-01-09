Rails.application.routes.draw do
  # Index page/route
  root 'tournaments#index'

  # Devise handles all of the user routing
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routing for showing user profile
  resources :users, only: [:show]

  # Routes for Tournaments
  resources :tournaments do
    resources :teams, except: [:index, :show]
    # get 'join' => 'teams#join'
    resources :teammates, only: [:new, :create, :destroy]
  end

  resources :teams, only: [:show]
end
