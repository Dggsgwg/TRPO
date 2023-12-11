Rails.application.routes.draw do
  get '/admin', to: "admin#index", as: :admin_panel
  get '/not_admin', to: "admin#chipi", as: :not_admin
  get '/travels/disapprove/:id', to: "travels#disapprove", as: :disapprove
  get '/travels/approve/:id', to: "travels#approve", as: :approve
  get '/travels/search', to: "travels#search", as: :search_travels
  resources :travels
  resources :user
  root "home#index"
  get '/home/index', to: "home#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
end
