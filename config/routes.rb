Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]

        mount_devise_token_auth_for 'Admin', at: 'admin_auth'
          as :admin do
            get '/users', to: 'users#index'
            get '/requests', to: 'requests#index'
            get '/requests/:id', to: 'requests#update'
          end
    
        resources :users, only: [:create] do
          resources :requests, only: [:create, :index, :show, :edit, :update] do
            resources :cuisines_requests, only: [:create, :index]
            resources :neighborhoods_requests, only: [:create, :index]
            resources :prices_requests, only: [:create, :index]
          end
        end
        # post '/auth', to: 'auth#create'
        resources :cuisines, only: [:index]
        resources :neighborhoods, only: [:index]
        resources :prices, only: [:index]
        # resources :requests, only: [:index, :update]
      end
    end
end

