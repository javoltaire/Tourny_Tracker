Rails.application.routes.draw do
  get 'tournaments/new'

  get 'tournaments/create'

  get 'tournaments/show'

  get 'tournaments/edit'

  get 'tournaments/update'

  get 'tournaments/destroy'

  get 'tournaments/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tournaments#index'
end
