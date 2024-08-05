Rails.application.routes.draw do
  resources :articles , only: [:show , :index]
  root 'site#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    root 'site#index'
    resources :articles
    resources :users, except: [:index, :new ,:create]
    get 'login', to: 'users#login_page', as: 'login'
    post 'login', to: 'users#user_login'
    get 'logup', to: 'users#new', as: 'logup'
    post 'logup', to: 'users#create'
  end
end