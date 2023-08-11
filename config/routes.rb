Rails.application.routes.draw do
  resources :pictures
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pictures#index"
  resources :comments, only: [:create]
end
