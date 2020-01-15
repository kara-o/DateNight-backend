Rails.application.routes.draw do
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]

    mount_devise_token_auth_for 'Admin', at: 'admin_auth', controllers: {
      sessions: 'overrides/admin_auth/sessions',
      registrations: 'overrides/admin_auth/registrations'
    }

    namespace :api do
      namespace :v1 do

        devise_scope :admin do
          # TODO: convert to resources
          get '/users', to: 'users#index'
          get '/requests', to: 'requests#index'
          get '/requests/:id', to: 'requests#show'
          post '/requests/:id', to: 'requests#update'
          patch '/requests/:id', to: 'requests#update'
          get '/itinerary_items', to: 'itinerary_items#index'
          post '/itinerary_items', to: 'itinerary_items#create'
          delete '/itinerary_items/:id', to: 'itinerary_items#destroy'

          post '/texts', to: 'texts#create'

          # Applying an Itinerary Package to a request
          post '/requests/:id/itinerary_packages', to: 'requests#apply_package'

          resources :itinerary_packages, only: [:index, :create, :show, :update] do
            resources :itinerary_package_items, only: [:create, :index, :destroy]
          end
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

    post '/scrapes', to: 'scrapes#get_names'
    post '/scrapes/single_page', to: 'scrapes#single_page'
end

