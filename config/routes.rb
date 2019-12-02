Rails.application.routes.draw do
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
    mount_devise_token_auth_for 'Admin', at: 'admin_auth', skip: [:omniauth_callbacks]

    namespace :api do
      namespace :v1 do

          # as :admin do
          #   resources :users, only:[:index]
          #   resources :requests, only:[:index, :show, :update]
          #   resources :itinerary_items, only: [:create]
          # end
        devise_scope :admin do
          get '/users', to: 'users#index'
          get '/requests', to: 'requests#index'
          get '/requests/:id', to: 'requests#show'
          post '/requests/:id', to: 'requests#update'
          get '/itinerary_items', to: 'itinerary_items#create'
        end
    
        resources :users, only: [:create] do
          resources :requests, only: [:create, :index, :show, :update] do
            resources :itinerary_items, only: [:index]
          end
        end
      
        get '/neighborhoods', to: 'neighborhoods#index'
        get '/price_ranges', to: 'price_ranges#index'
      end
    end
end

