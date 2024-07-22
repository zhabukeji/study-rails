Rails.application.routes.draw do
  root 'site#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/article(/:id)' , to: "article#index" , as: "article"
end
