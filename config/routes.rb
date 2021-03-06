Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show'
  post 'user/edit', to: 'users#update'
  get '/selling_orders', to: 'orders#selling_orders'
  get '/buying_orders', to: 'orders#buying_orders'
  get '/all-request', to: 'requests#list'
  post '/offers', to: 'offers#create'
  get '/request_offers/:id', to:'requests#offers', as: 'request_offers'

  put '/orders/:id/complete', to: 'orders#complete', as: 'complete_order'
  put '/offers/:id/accept', to: 'offers#accept', as: "accept_offer"
  put '/offers/:id/rejected', to: 'offers#reject', as: "reject_offer"

  resources :gigs do
    member do
      delete :delete_photo
      post :upload_photo
    end
    resources :orders, only: [:create]
  end

  resources :requests

  devise_for :users, path: '', 
              path_names: {sign_up: 'register', sign_in: 'login',
                          sign_out: 'logout', edit: 'profile'},
                          controllers: {omniauth_callbacks:'omniauth_callbacks',
                          registrations:'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
