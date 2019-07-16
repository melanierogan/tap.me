Rails.application.routes.draw do
  get 'sessions/new'
  root 'posts#index'

  resources :posts

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  post 'login' => 'sessions#create'
  get 'stories' => 'posts#postsJS'
  get 'sentiment' => 'posts#sentiment'

  get '/about' => 'about#index'
  resources :users

end
