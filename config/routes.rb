Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/create'

  get 'comments/new'

  get 'comments/edit'

  get 'comments/show'

  get 'comments/update'

  get 'comments/destroy'

  get 'images/index'

  get 'images/create'

  get 'images/new'

  get 'images/edit'

  get 'images/show'

  get 'images/update'

  get 'images/destroy'

  root 'users#index'
  resources :users

  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]

end
