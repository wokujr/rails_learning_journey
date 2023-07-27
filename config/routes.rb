Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # My defined Route HERE
  get "about", to: "about#index", as: :about
  # can leave without (as: :about) and it will generate automatically

  #edit password
  get "password", to: "passwords#edit", as: :password_edit
  patch "password", to: "passwords#update"



  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "session#new"
  post "sign_in", to: "session#create"

  #reset password/ user forgot password
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  #for password rest
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", ro: "password_resets#update"


  delete "logout", to: "session#delete"

  root to:"main#index"
  # can do get "/", to:"main#index"



  # Defines the root path route ("/")
  # root "articles#index"
end
