Rails.application.routes.draw do
  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users, only: [:create, :index] do
          resources :requests, only: [:create, :index, :show] do
            resources :cuisines_requests, only: [:create, :index]
            resources :neighborhoods_requests, only: [:create, :index]
            resources :prices_requests, only: [:create, :index]
          end
        end
        post '/auth', to: 'auth#create'
        resources :cuisines, only: [:index]
        resources :neighborhoods, only: [:index]
        resources :prices, only: [:index]
        get '/requests', to: 'requests#index'
      end
    end
  end
end
