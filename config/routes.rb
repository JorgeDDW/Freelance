Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show'
  post 'user/edit', to: 'users#update'
  get '/selling_orders', to: 'orders#selling_orders'
  get '/buying_orders', to: 'orders#buying_orders'

  put '/orders/:id/complete', to: 'orders#complete', as: 'complete_order'


  resources :gigs do
    member do
      delete :delete_photo
      post :upload_photo
    end
    resources :orders, only: [:create]
  end

  devise_for :users, path: '', 
              path_names: {sign_up: 'register', sign_in: 'login',
                          sign_out: 'logout', edit: 'profile'},
                          controllers: {omniauth_callbacks:'omniauth_callbacks',
                          registrations:'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
