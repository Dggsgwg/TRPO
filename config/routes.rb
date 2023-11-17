Rails.application.routes.draw do
  root "home#index"
  get '/home/index', to: "home#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
end
