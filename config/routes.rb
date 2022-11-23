Rails.application.routes.draw do
  devise_for :users
  root to: "laptops#index"
  get "about", to: "statics#about"
  get "home", to: "statics#home"

  resources :laptops do
    resources :bookings, only: %i[destroy new create index]
  end
  resources :bookings, only: %i[show edit update new create destroy]
end
