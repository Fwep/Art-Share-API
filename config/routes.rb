Rails.application.routes.draw do
  resources :users
  # get 'users', to: 'users#index', as: 'user'
  # post 'users', to: 'users#create', as: 'create_user'
end
