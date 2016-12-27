Rails.application.routes.draw do
  devise_for :users

  get 'movies/search', to: 'movies#index', as: :search_movies
  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:edit, :update, :destroy]

  root 'movies#index'
end
