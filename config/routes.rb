Rails.application.routes.draw do
  resources :articles
  root 'site#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    get 'article/index'
    get 'article' , to: 'article#index'
    get '/' , to: 'site#index'
  end
end
