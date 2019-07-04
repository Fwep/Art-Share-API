Rails.application.routes.draw do
  resources :users, :artworks, only: [:create, :index, :show, :update, :destroy]
end
