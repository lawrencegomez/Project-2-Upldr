Rails.application.routes.draw do

  root 'users#index'

  resources :users

  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]

  resources :comments
  resources :images

end
