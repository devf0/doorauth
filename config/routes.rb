Rails.application.routes.draw do
  use_doorkeeper_openid_connect
  use_doorkeeper
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/' => redirect('/login')
  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#destroy'
  get :welcome, to: 'welcome#index'
  get :me, to: 'me#show'

  resources :sessions, only: [:create]
end
