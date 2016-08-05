Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root "static_pages#home"
  resources :books, only: [:index, :show]
  namespace :admin do
    resources :books
    resources :users, only: [:show, :index, :destroy]
  end
  resources :users, only: :show
end
