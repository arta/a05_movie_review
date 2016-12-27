Rails.application.routes.draw do
  devise_for :users

  get 'movies/search', to: 'movies#index', as: :search_movies
  resources :movies do
    resources :reviews, shallow: true, except: [:index, :show]
  end

  root 'movies#index'
end
