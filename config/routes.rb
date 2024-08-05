Rails.application.routes.draw do
  resources :articles , only: [:show , :index]
  root 'site#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    root 'site#index'
    resources :articles
    get 'login', to: 'logins#index'
  end
end