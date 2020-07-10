Rails.application.routes.draw do
  root to: 'pages#home'
  
  resources :companies, only: [:index, :show]
  resources :trades, only: [:index, :show]
  resources :stocks, only: [:index, :show]
  resources :listings, only: [:index, :show, :create, :new, :edit]

  resource :session, only: [:new, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :show] do 
    resources :listings, only: [:new, :create, :index, :show]
    resources :trades, only: [:new, :create, :index, :show]
    resources :owned_by_users, only: [:new, :create, :index, :show]
  end

  post '/users/new', to: 'users#create'
  
  get '/login', to: 'sessions#new', as: 'login'
  post'/login', to: 'sessions#create'

  delete 'sessions/logout', to: 'sessions#logout', as: 'sessions_logout'

  get '/users/:id/portfolio', to:"users#portfolio", as: 'user_portfolio'

  get '/stock-listings/:id', to:'listings#index2', as: 'stock_listings'

end