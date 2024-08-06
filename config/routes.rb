Rails.application.routes.draw do
  # http_verb '/path', to: 'controller#action', as: :prefix
  # prefix is ONLY connected to the path (not the verb)
  get '/restaurants', to: 'restaurants#index', as: :restaurants
  # Create
  # page for our form
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  # a place to send the form info and create the instance
  post '/restaurants', to: 'restaurants#create'

  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant

end

# See all restaurants -> index
# See details about one restaurant -> show
# Create a restaurant
# Update a restaurant
# Destroy a restaurant
