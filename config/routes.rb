Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: {
      confirmations:      'api/v1/auth/confirmations',
      passwords:          'api/v1/auth/passwords',
      registrations:      'api/v1/auth/registrations',
      sessions:           'api/v1/auth/sessions',
      token_validations:  'api/v1/auth/token_validations'
    }

    mount_devise_token_auth_for 'Admin', at: 'admin_auth', controllers: {
      confirmations:      'api/v1/admin_auth/confirmations',
      passwords:          'api/v1/admin_auth/passwords',
      sessions: 'api/v1/admin_auth/sessions',
      registrations: 'api/v1/admin_auth/registrations',
      token_validations:  'api/v1/admin_auth/token_validations'
    }

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

          # Adding single Itinerary Item to a request
          post '/requests/:id/itinerary_items', to: 'requests#add_single_item'

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

