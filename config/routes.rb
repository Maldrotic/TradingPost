Rails.application.routes.draw do

  root to: 'home#index'

  # Login and logout routes
  get '/login', to: 'sessions#new'
  post '/login', to:'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # Signup routes
  get '/signup', to: 'users#new'
  post '/users', to:'users#create'

  # User profile routes
  get '/users/:user_id', to: 'users#show'

  # Posts routes
  get '/posts', to: 'posts#show_all'
  get '/posts/show/:id', to: 'posts#show'
  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create' 
  get '/users/:user_id/posts', to: 'posts#show_all'

end
