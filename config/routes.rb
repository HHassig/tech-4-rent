Rails.application.routes.draw do
  devise_for :users
  root to: "statics#home"
  get "about", to: "statics#about"
  get "home", to: "statics#home"

  resources :laptops do
    resources :bookings, only: %i[show destroy new create index]
  end
  resources :bookings, only: %i[edit update destroy]
end
