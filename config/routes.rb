Rails.application.routes.draw do
  resources :articles , only: [:show , :index]
  root 'site#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    root 'site#index'
    resources :articles
    get 'logup', to: 'users#new', as: :logup
    post 'logup', to: 'users#create'
    resources :users, except: [:index, :new ,:create]
    get 'login', to: 'user_sessions#new', as: :login
    post 'login', to: "user_sessions#create"
    get 'logout', to: 'user_sessions#destroy', as: :logout
  end
end