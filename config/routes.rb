OhExcusesApp2::Application.routes.draw do

  get "pages/home"

  get "pages/search"

  get "pages/location"

  get "pages/tag"

  get "pages/favorite"

  get "pages/user"

  # sessions_controller
  get     '/login'      => 'sessions#new',      :as => :login
  post    '/login'      => 'sessions#create'
  get     '/logout'     => 'sessions#destroy',  :as => :logout

  # users_controller
  resources :users

  # searches_controller
  resources :searches

  # locations_controller
  resources :locations

  # excuses_controller
  resources :excuses

  # root_url
  root :to => 'excuses#index'

end