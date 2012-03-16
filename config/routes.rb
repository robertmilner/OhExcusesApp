OhExcusesApp2::Application.routes.draw do

  # pages_controller
  get     '/excuse'           => 'pages#excuse',      :as => :app_excuse
  get     '/search'           => 'pages#search',      :as => :app_search
  get     '/location'         => 'pages#location',    :as => :app_location
  get     '/location/:search' => 'pages#location'
  get     '/tag'              => 'pages#tag',         :as => :app_tag
  get     '/favorite'         => 'pages#favorite',    :as => :app_favorite
  get     '/user'             => 'pages#user',        :as => :app_user

  # sessions_controller
  get     '/login'    => 'sessions#new',      :as => :login
  post    '/login'    => 'sessions#create'
  get     '/logout'   => 'sessions#destroy',  :as => :logout

  # users_controller
  get     '/account'  => 'users#show',        :as => :account
  resources :users

  # searches_controller
  resources :searches

  # locations_controller
  resources :locations

  # excuses_controller
  resources :excuses

  # favorites_controller
  resources :favorites

  # root_url
  root :to => 'pages#excuse'

end