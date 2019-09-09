Rails.application.routes.draw do

  root 'welcome#homepage'
  
  get '/login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :books, only: [:index, :show]
  resources :authors, only: [:index, :show]

  get '/reading_lists/:id', to: 'reading_lists#show', as: 'reading_list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
