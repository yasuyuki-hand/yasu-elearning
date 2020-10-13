Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'


  resources :users
  
  #HTTP ACTION '/route-name', to: 'controller_name#action'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'


  resources :sessions, only: [:new, :create, :destroy]


  #/login
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
