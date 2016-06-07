Rails.application.routes.draw do

  root 'sessions#new'

  resources :users

  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]

  resources :comments
  resources :images

end
