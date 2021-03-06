Rails.application.routes.draw do

  root 'welcome#homepage'
  
  get '/login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :edit, :update]
  resources :books, only: [:index, :show]
  # resources :authors, only: [:index, :show]
  resources :reviews, only: [:new, :create, :edit, :update, :destroy]

  get '/reading_list', to: 'users#reading_list'
  post '/add_to_reading_list/:id', to: 'books#add_to_reading_list'
  delete '/remove_from_reading_list/:id', to: 'books#remove_from_reading_list'

  get '/search', to: 'books#search'
  post '/add_to_reading_list_via_api', to: 'books#add_to_reading_list_via_api'
  delete '/remove_from_reading_list_via_api', to: 'books#remove_from_reading_list_via_api'
  delete '/remove_from_reading_list', to: 'books#remove_from_reading_list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
