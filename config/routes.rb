Rails.application.routes.draw do
  resources :attractions

  get 'home/index'
  post '/ride', to: 'attractions#ride'


  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'

  get '/', to: 'home#index'
  resources :users 

  root 'home#index'

end