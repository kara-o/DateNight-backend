Rails.application.routes.draw do
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
    # mount_devise_token_auth_for 'Admin', at: 'admin_auth', skip: [:omniauth_callbacks]

    mount_devise_token_auth_for 'Admin', at: 'admin_auth', controllers: {
      sessions: 'overrides/admin_auth/sessions',
      registrations: 'overrides/admin_auth/registrations'
    }

    namespace :api do
      namespace :v1 do

        # TODO: ensure regular users cannot access these routes
        devise_scope :admin do
          get '/users', to: 'users#index'
          get '/requests', to: 'requests#index'
          get '/requests/:id', to: 'requests#show'
          post '/requests/:id', to: 'requests#update'
          patch '/requests/:id', to: 'requests#update'
          get '/itinerary_items', to: 'itinerary_items#index'
          post '/itinerary_items', to: 'itinerary_items#create'
          get '/itinerary_packages', to: 'itinerary_packages#index'
          post '/itinerary_packages', to: 'itinerary_packages#create'
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

