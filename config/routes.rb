Rails.application.routes.draw do
  get '/travels/search', to: "travels#search", as: :search_travels
  resources :travels
  resources :user
  root "home#index"
  get '/home/index', to: "home#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
end
