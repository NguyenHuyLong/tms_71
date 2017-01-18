Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/pages/*page", to: "static_pages#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, except: [:index, :destroy]
  resources :courses, only: :index
  resources :user_courses, only: :show do
    resources :user_subjects, only: :show
  end
  resources :user_tasks, only: :create

  namespace :supervisors do
    resources :courses
    resources :subjects
    resources :users
  end
end
