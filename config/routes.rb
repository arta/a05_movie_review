Rails.application.routes.draw do
  devise_for :users
  resources :movies
  resources :reviews

  root 'movies#index'
end
