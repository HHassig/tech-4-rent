Rails.application.routes.draw do
  devise_for :users
  root to: "statics#home"

  resources :laptops do
    resources :bookings, only: %i[index, new, create]
  end
  resources :bookings, only: %i[show, edit, update, destroy]
end
