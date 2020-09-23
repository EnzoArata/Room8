Rails.application.routes.draw do
  root "pages#home"

  get "home", to: "pages#home"
  get "houseStatus", to: "pages#houseStatus"
  resources :houses, except: [:new]
  get "newHouse", to: "houses#new"
  get "signup", to: "users#new"
  post "users", to: "users#create"
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "newTask", to: "tasks#new"
  post "newTask", to: "task#create"
  resources :tasks, except: [:new]
end
