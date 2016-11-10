Rails.application.routes.draw do

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
  get '/posts/delete/:id', to: 'posts#destroy'
  get '/instruments/:instrument_id/posts', to: 'posts#show_posts_for_instrument'

  get '/posts/search', to: 'posts#search'

  get '/messages', to: 'messages#show_all'
  get '/messages/show/:id', to: 'messages#show'
  get '/posts/:post_id/messages/new', to: 'messages#new'
  post '/posts/:post_id/messages', to: 'messages#create'

  get '/categories/new', to: 'categories#new'
  post '/categories', to: 'categories#create'
  get '/categories/show/:category_id', to: 'categories#show'
  get '/categories', to: 'categories#show_all'

  get '/categories/:category_id/instruments/new', to: 'instruments#new'
  post '/categories/:category_id/instruments', to: 'instruments#create'
end
