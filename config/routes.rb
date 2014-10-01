Rails.application.routes.draw do

  root "homepage#index"

  resources :registrations, only: [:new,:create]

  resources :users

end
