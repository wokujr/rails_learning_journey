Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # My defined Route HERE
  get "about", to:"about#index", as: :about
  #or you can leave withou as: :about and it will generate automatically

  root to:"main#index"
  # or you can do get "/", to:"main#index"


  # Defines the root path route ("/")
  # root "articles#index"
end
