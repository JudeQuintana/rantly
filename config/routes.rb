Rails.application.routes.draw do

  root "homepage#index"

  get "signin" => "sessions#new", as: :signin

  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  get "dashboard" => "dashboard#index", as: :dashboard

  resources :registrations, only: [:new, :create]

  resources :users do
    resources :comments, only:[:create]
  end

  resources :rants, only: [:show, :create, :destroy] do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only:[:create]
  end
  get 'favorites', to: 'favorites#index'
  get 'following' => 'following_relationships#index'
  post 'follow/:id' => 'following_relationships#create', as: :follow
  delete 'follow/:id' => 'following_relationships#destroy'

  resources :search, only: [:index]
end
