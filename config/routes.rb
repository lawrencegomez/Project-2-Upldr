Rails.application.routes.draw do

  get '/howTo' => 'extras#howTo', as: :how_to

  root 'extras#index'

  resources :users  


  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]

  resources :comments
  resources :images do
    member do
      put "like", to: "images#upvote"
    end
  end

  resources :images do
    resources :comments
  end

end
