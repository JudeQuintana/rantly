Rails.application.routes.draw do

  root "homepage#index"

  get "signin" => "sessions#new", as: :signin

  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  get "dashboard" => "dashboard#index", as: :dashboard

  resources :registrations, only: [:new, :create]

  resources :users do
  end

  resources :rants, only: [:show, :create, :destroy] do
    resources :favorites, only: [:index, :create, :destroy]
  end
  get 'following' => 'following_relationships#index'
  post 'follow/:id' => 'following_relationships#create', as: :follow
  delete 'follow/:id' => 'following_relationships#destroy'

  # get 'favorites' => 'favorites#index'
  # post 'favorite/:id' => 'favorites#create', as: :favorite
  # delete 'favorite/:id' => 'favaorites#destroy'


end
