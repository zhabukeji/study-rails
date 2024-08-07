Rails.application.routes.draw do
  resources :articles , only: [:show , :index]
  root 'site#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    root 'site#index'
    resources :articles
    get 'login', to: 'users#new', as: :login
    post 'login', to: 'users#create'
    resources :users, except: [:index, :new ,:create]
    get 'logup', to: 'user_sessions#new', as: :logup
    post 'logup', to: "user_sessions#create"
    get 'logout', to: 'user_sessions#destroy', as: :logout
  end
end