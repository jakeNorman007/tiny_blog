Rails.application.routes.draw do
  # the routes, this comment doesn't even seem nesseccary
  root 'pages#home'
  get 'about', to: 'pages#about'

  # don't have to show 'only' because all routes are exposed.
  resources :articles do
    resources :comments
  end
  
  get 'signup', to: 'users#new'
  resources :users

  # log in routes built here because they aren't hitting the database
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'
end
