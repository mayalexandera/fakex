# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        pages#home
#                             companies GET    /companies(.:format)                                                                     companies#index
#                                       POST   /companies(.:format)                                                                     companies#create
#                           new_company GET    /companies/new(.:format)                                                                 companies#new
#                          edit_company GET    /companies/:id/edit(.:format)                                                            companies#edit
#                               company GET    /companies/:id(.:format)                                                                 companies#show
#                                       PATCH  /companies/:id(.:format)                                                                 companies#update
#                                       PUT    /companies/:id(.:format)                                                                 companies#update
#                                       DELETE /companies/:id(.:format)                                                                 companies#destroy
#                                trades GET    /trades(.:format)                                                                        trades#index
#                                       POST   /trades(.:format)                                                                        trades#create
#                             new_trade GET    /trades/new(.:format)                                                                    trades#new
#                            edit_trade GET    /trades/:id/edit(.:format)                                                               trades#edit
#                                 trade GET    /trades/:id(.:format)                                                                    trades#show
#                                       PATCH  /trades/:id(.:format)                                                                    trades#update
#                                       PUT    /trades/:id(.:format)                                                                    trades#update
#                                       DELETE /trades/:id(.:format)                                                                    trades#destroy
#                                stocks GET    /stocks(.:format)                                                                        stocks#index
#                                       POST   /stocks(.:format)                                                                        stocks#create
#                             new_stock GET    /stocks/new(.:format)                                                                    stocks#new
#                            edit_stock GET    /stocks/:id/edit(.:format)                                                               stocks#edit
#                                 stock GET    /stocks/:id(.:format)                                                                    stocks#show
#                                       PATCH  /stocks/:id(.:format)                                                                    stocks#update
#                                       PUT    /stocks/:id(.:format)                                                                    stocks#update
#                                       DELETE /stocks/:id(.:format)                                                                    stocks#destroy
#                              listings GET    /listings(.:format)                                                                      listings#index
#                                       POST   /listings(.:format)                                                                      listings#create
#                           new_listing GET    /listings/new(.:format)                                                                  listings#new
#                          edit_listing GET    /listings/:id/edit(.:format)                                                             listings#edit
#                               listing GET    /listings/:id(.:format)                                                                  listings#show
#                                       PATCH  /listings/:id(.:format)                                                                  listings#update
#                                       PUT    /listings/:id(.:format)                                                                  listings#update
#                                       DELETE /listings/:id(.:format)                                                                  listings#destroy
#                   user_owned_by_users GET    /users/:user_id/owned_by_users(.:format)                                                 owned_by_users#index
#                                       POST   /users/:user_id/owned_by_users(.:format)                                                 owned_by_users#create
#                new_user_owned_by_user GET    /users/:user_id/owned_by_users/new(.:format)                                             owned_by_users#new
#               edit_user_owned_by_user GET    /users/:user_id/owned_by_users/:id/edit(.:format)                                        owned_by_users#edit
#                    user_owned_by_user GET    /users/:user_id/owned_by_users/:id(.:format)                                             owned_by_users#show
#                                       PATCH  /users/:user_id/owned_by_users/:id(.:format)                                             owned_by_users#update
#                                       PUT    /users/:user_id/owned_by_users/:id(.:format)                                             owned_by_users#update
#                                       DELETE /users/:user_id/owned_by_users/:id(.:format)                                             owned_by_users#destroy
#                                 users GET    /users(.:format)                                                                         users#index
#                                       POST   /users(.:format)                                                                         users#create
#                              new_user GET    /users/new(.:format)                                                                     users#new
#                             edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                                  user GET    /users/:id(.:format)                                                                     users#show
#                                       PATCH  /users/:id(.:format)                                                                     users#update
#                                       PUT    /users/:id(.:format)                                                                     users#update
#                                       DELETE /users/:id(.:format)                                                                     users#destroy
#                           new_session GET    /session/new(.:format)                                                                   sessions#new
#                               session DELETE /session(.:format)                                                                       sessions#destroy
#                                       POST   /session(.:format)                                                                       sessions#create
#                         user_listings GET    /users/:user_id/listings(.:format)                                                       listings#index
#                                       POST   /users/:user_id/listings(.:format)                                                       listings#create
#                      new_user_listing GET    /users/:user_id/listings/new(.:format)                                                   listings#new
#                          user_listing GET    /users/:user_id/listings/:id(.:format)                                                   listings#show
#                           user_trades GET    /users/:user_id/trades(.:format)                                                         trades#index
#                                       POST   /users/:user_id/trades(.:format)                                                         trades#create
#                        new_user_trade GET    /users/:user_id/trades/new(.:format)                                                     trades#new
#                            user_trade GET    /users/:user_id/trades/:id(.:format)                                                     trades#show
#                                       GET    /users/:user_id/owned_by_users(.:format)                                                 owned_by_users#index
#                                       POST   /users/:user_id/owned_by_users(.:format)                                                 owned_by_users#create
#                                       GET    /users/:user_id/owned_by_users/new(.:format)                                             owned_by_users#new
#                                       GET    /users/:user_id/owned_by_users/:id(.:format)                                             owned_by_users#show
#                                       GET    /users(.:format)                                                                         users#index
#                                       POST   /users(.:format)                                                                         users#create
#                                       GET    /users/new(.:format)                                                                     users#new
#                                       GET    /users/:id(.:format)                                                                     users#show
#                        stock_listings GET    /stock-listings/:id(.:format)                                                            listings#index2
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root to: 'pages#home'
  
  resources :companies, only: [:index, :show]
  resources :trades
  resources :stocks, only: [:index, :show]
  resources :listings


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
