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
    resources :teams, except: [:index]
    get 'join' => 'tournaments#join'
  end

  

  # get '/tournaments' => 'tournaments#index'
  # get '/tournaments/new' => 'tournaments#new', :as => :new_tournament
  # post '/tournaments/new' => 'tournaments#create', :as => :create_tournament
  # get '/tournaments/show' => 'tournaments#show', :as => :show_tournament
  # get '/tournaments/edit' => 'tournaments#edit', :as => :edit_tournament

  # patch '/tournaments/update' => 'tournaments#update', :as => :update_tournament

  # get 'tournaments/join' => 'tournaments#join', :as => :join_tournament

  # get '/tournaments/destroy' => 'tournaments#destroy', :as => :destroy_tournament


end
