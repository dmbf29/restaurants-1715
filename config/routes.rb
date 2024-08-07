Rails.application.routes.draw do
  # http_verb '/path', to: 'controller#action', as: :prefix
  # prefix is ONLY connected to the path (not the verb)
  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
  # get '/restaurants/top', to: 'restaurants#top', as: :top_restaurants
  # get '/restaurants/:id/chef'
end


# Non-CRUD route keywords
# collection -> all restaurants
# member -> one restaurant (aka need the ID)
# collection do
#   get :top
# end
# member do
#   get :chef
# end
