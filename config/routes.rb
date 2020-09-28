Rails.application.routes.draw do
  root "pages#home"

  get "home", to: "pages#home"
  get "houseStatus", to: "pages#houseStatus"
  get "addToHouse", to: "users#addToHouse"
  get "addRequest", to: "houses#addRequest"
  get "acceptRequest", to: "houses#acceptRequest"
  get "removeFromHouse", to: "users#removeFromHouse"
  get "createManyTasks", to: "tasks#createManyTasks"
  get "completeTask", to: "tasks#completeTask"
  get "uncompleteTask", to: "tasks#uncompleteTask"
  get "approveTask", to: "tasks#approveTask"
  get "completePayment", to: "payments#completePayment"
  get "uncompletePayment", to: "payments#uncompletePayment"
  get "approvePayment", to: "payments#approvePayment"
  resources :houses, except: [:new]
  get "newHouse", to: "houses#new"
  get "signup", to: "users#new"
  post "users", to: "users#create"
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "newTask", to: "tasks#new"
  post "newTask", to: "tasks#create"
  get "newPayment", to: "payments#new"
  post "newPayment", to: "payments#create"
  resources :tasks, except: [:new]
  resources :payments, except: [:new]
end
