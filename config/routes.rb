Rails.application.routes.draw do
  get 'sessions/new'
  root 'toggle#show'


  resources :posts

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  get 'testpost' => 'users#testpost'
  resources :users

end
