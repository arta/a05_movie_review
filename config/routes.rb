Rails.application.routes.draw do
  devise_for :users

  resources :movies do
    get 'search', on: :collection
    resources :reviews, except: [:index, :show]
  end

  root 'movies#index'
end
