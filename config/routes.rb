Rails.application.routes.draw do
  root to: "laptops#home"

  resources :laptops do
    resources :bookings, only: %i[index, new, create]
  end
  resources :bookings, only: %i[show, edit, update, destroy]
end
