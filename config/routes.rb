Rails.application.routes.draw do
  # http_verb '/path', to: 'controller#action', as: :prefix
  # prefix is ONLY connected to the path (not the verb)
  root to: 'restaurants#index'
  get '/restaurants', to: 'restaurants#index', as: :restaurants

  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  post '/restaurants', to: 'restaurants#create'

  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant

  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  patch '/restaurants/:id', to: 'restaurants#update'

  # destroy
  delete '/restaurants/:id', to: 'restaurants#destroy'
end

# See all restaurants -> index
# See details about one restaurant -> show
# Create a restaurant
# Update a restaurant
# Destroy a restaurant
