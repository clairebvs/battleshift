Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/register', to: 'users#new'
  get '/dashboard', to: 'dashboard#show'

  # get '/users/:activation_token/confirmation', to: 'confirmation#show'

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
      resources :users, only: [:index, :show, :update]
    end
  end

  resources :users, only: [:index, :show, :edit, :update, :create] do
    get '/:activation_token/confirmation', to: 'confirmation#show'
  end

end
