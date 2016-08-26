Rails.application.routes.draw do
  
  
  resources :users
  resources :campaigns
  resources :sessions
  resources :players
  resources :encounters
  resources :enemies

  get 'encounters/:id/index' => 'encounters#all'
  post	'units' => 'encounters#units'
  get '/turn_order' => 'encounters#turn_order'


  root 'sessions#new'
end
