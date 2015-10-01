Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show, :index]
  get 'users/show'
  patch '/users/:id', to: 'users#update'
  get 'users/update'
  post '/points', to: 'points#create'
  root 'events#index'
  # get 'event#new'
  resources :events
end
