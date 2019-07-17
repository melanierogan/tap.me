Rails.application.routes.draw do

  default_url_options protocol: :https
  
  get 'sessions/new'
  root 'posts#index'

  resources :posts

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  post 'login' => 'sessions#create'
  get 'stories' => 'posts#postsJS'
  get '/about' => 'about#index'
  resources :users

end
