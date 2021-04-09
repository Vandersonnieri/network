Rails.application.routes.draw do
  root 'user#index'
  post "/register", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :posts
end
