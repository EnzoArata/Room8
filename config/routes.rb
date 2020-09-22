Rails.application.routes.draw do
  root "pages#home"

  get "home", to: "pages#home"
  resources :houses
  get "signup", to: "users#new"
  post "users", to: "users#create"
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :tasks
end
