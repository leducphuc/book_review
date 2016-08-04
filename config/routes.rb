Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root "static_pages#home"
  resources :books, only: [:index, :show]
  namespace :admin do
    resources :books 
  end
  resources :users, only: :show
end
