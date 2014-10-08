Rails.application.routes.draw do

  root "homepage#index"

  get "signin" => "sessions#new", as: :signin

  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  get "dashboard" => "dashboard#index", as: :dashboard

  resources :registrations, only: [:new,:create]

  resources :users do
    resources :rants
  end


end
