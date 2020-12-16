Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :restaurants, only: [:index, :show]
  # HTTPverb '/route', to: 'controller#action'
  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/high_dollar', to: 'restaurants#high_dollar', as: 'high_dollar_restaurants'
  get '/restaurants/:id', to: 'restaurants#show', as: 'restaurant'
end
