Rails.application.routes.draw do
  resources :houses
  get "signup", to: "users#new"
  post "users", to: "users#create"
  resources :users, except: [:new]
  resources :tasks
end
