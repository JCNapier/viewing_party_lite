# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homepage#index'

  get '/register', to: 'user#new'
  get '/login', to: 'user#login_form'
  post '/login', to: 'user#login'

  # resources :user, only: [:show, :create] do
  #   resources :discover, only: [:index]
  get '/user/:user_id/discover', to: 'discover#index'
  post '/user/:user_id/movie/:movie_id/viewing_party', to: 'viewing_party#create'
  get '/user/:user_id/movie/:movie_id/viewing_party/new', to: 'viewing_party#new'
  get '/user/:user_id/movie', to: 'movie#index'
  get '/user/:user_id/movie/:movie_id', to: 'movie#show'
  post '/user', to: 'user#create'
  get '/user/:id', to: 'user#show'

  resources :movie, only: [:index, :show] do
    resources :viewing_party, only: [:new, :create]
  end
end

