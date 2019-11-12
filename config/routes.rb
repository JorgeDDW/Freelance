Rails.application.routes.draw do
  
  get '/dashboard', to: 'users#dashboard'
  post 'user/edit', to: 'users#update'
  root 'pages#home'
  devise_for :users, path: '', 
              path_names: {sign_up: 'register', sign_in: 'login',
                          sign_out: 'logout', edit: 'profile'},
                          controllers: {omniauth_callbacks:'omniauth_callbacks',
                          registrations:'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
