LouiseDaCocodia::Application.routes.draw do

  # Contact routes
  # get "contact/index"

  match 'contact', to: 'contact#new', as: 'contact'
  match 'dispatch_email', to: 'contact#dispatch_email', as: 'dispatch_email', method: :post

  # The routes, this is where I can set up URLs for the system.
  get "about", to: 'about#index'
  get "about/donate"
  get "about/objectives"
  get "about/volunteering"
  get "about/history"

  root to: 'home#index'

  # Allow us to access URLS like /users/new /users/create
  resources :users, only:[:new, :create]
  resources :sessions, only:[:new, :create]
  resources :posts, except:[:new, :index]

  # Allow URLS like /login, /register, /logout
  match '/register', to: 'users#new'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', method: :delete
  match '/blog', to: 'posts#index'
  match '/blog/new', to: 'posts#new'
  match "/blog/id/:id", to: "posts#single_post"

end
