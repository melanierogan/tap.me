Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#index'

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  get 'testpost' => 'users#testpost'
  resources :users


end
