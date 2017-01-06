Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/pages/*page", to: "static_pages#show"
  resources :users, only: [:index, :new, :create]
end
