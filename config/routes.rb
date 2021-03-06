Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/register', to: 'users#new'
  get '/dashboard', to: 'dashboard#show'

  resources :confirmation, only: [:edit]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show, :create] do
        post "/shots", to: "games/shots#create"
        post '/ships', to: 'games/ships#create'
      end
      resources :users, only: [:index, :show, :update]
    end
  end

  resources :users, only: [:index, :show, :edit, :update, :create]
end
