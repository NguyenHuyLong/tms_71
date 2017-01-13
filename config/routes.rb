Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/pages/*page", to: "static_pages#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, except: [:destroy]
  resources :courses, only: :show
  resources :subjects, only: :show

  namespace :supervisors do
    resources :courses
    resources :subjects
    resources :users
    resources :courses, only: [:show, :update]
  end
end
