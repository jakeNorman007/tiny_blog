Rails.application.routes.draw do
  # the routes, this comment doesn't even seem nesseccary
  root 'pages#home'
  get 'about', to: 'pages#about'

  # don't have to show 'only' because all routes are exposed.
  resources :articles
  get 'signup', to: 'users#new'
  resources :users

  # log in routes built here because they aren't hitting the database
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
