Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]

        mount_devise_token_auth_for 'Admin', at: 'admin_auth'
          as :admin do
            resources :users, only:[:index]
            resources :requests, only:[:index, :show, :update]
            resources :itinerary_items, only: [:create]
          end
    
        resources :users, only: [:create] do
          resources :requests, only: [:create, :index, :show, :update] do
            resources :itinerary_items, only: [:index]
          end
        end
      
        get '/neighborhoods', to: 'neighborhoods#index'
      end
    end
end

