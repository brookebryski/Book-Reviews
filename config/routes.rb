Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#create'
  
  resources :reviews
  resources :books do
    resources :reviews, only: [:new, :index]
  end
  resources :authors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
