Rails.application.routes.draw do
  resources :users do 
    resources :artworks, only: :index
  end
  
  resources :artworks, only: [:create, :show, :update, :destroy]

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy, :index]
end
