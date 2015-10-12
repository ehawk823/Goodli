Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show, :index]
  get 'users/show'
  patch '/users/:id', to: 'users#update'
  get 'users/update'
  post '/points', to: 'points#create'
  post 'events/rsvp'
  root 'events#index'
  # get 'event#new'
  post '/events/list', to: 'events#get_petitions'
  get '/events/list', to: 'events#petition'
  resources :events
  post 'events/destroy'
end
