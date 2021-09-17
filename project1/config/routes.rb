Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'
  get 'index' => 'tasks#index'
  get 'new' => 'tasks#new'
  get 'show' => 'tasks#show'

  resources :tasks
 
  
end


