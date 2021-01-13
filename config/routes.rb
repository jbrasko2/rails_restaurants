Rails.application.routes.draw do

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :restaurants, only: [:index, :show]
  # HTTPverb '/route', to: 'controller#action'
  # get '/restaurants', to: 'restaurants#index'
  # get '/restaurants/:id', to: 'restaurants#show', as: 'restaurant'
  get '/auth/:provider/callback', to: "sessions#omniauth"
  get '/restaurants/high_dollar', to: 'restaurants#high_dollar', as: 'high_dollar_restaurants'
  resources :restaurants
  resources :cuisines,  only: [:new, :create, :index, :show] do
    resources :restaurants, only: [:new, :create, :index]
  end
end
