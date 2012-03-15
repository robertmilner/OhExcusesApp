OhExcusesApp2::Application.routes.draw do

  # pages_controller
  get   '/excuse'           => 'pages#excuse',      :as => :excuse
  get   '/search'           => 'pages#search',      :as => :search
  get   '/location'         => 'pages#location',    :as => :location
  get   '/location/:search' => 'pages#location'
  get   '/tag'              => 'pages#tag',         :as => :tag
  get   '/favorite'         => 'pages#favorite',    :as => :favorite
  get   '/user'             => 'pages#user',        :as => :user

  # sessions_controller
  get     '/login'    => 'sessions#new',      :as => :login
  post    '/login'    => 'sessions#create'
  get     '/logout'   => 'sessions#destroy',  :as => :logout

  # users_controller
  resources :users

  # searches_controller
  resources :searches

  # locations_controller
  resources :locations

  # excuses_controller
  resources :excuses

  # root_url
  root :to => 'pages#excuse'

end