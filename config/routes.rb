Rails.application.routes.draw do
  devise_for :users

  resources :bookings, except: [:new, :edit]

  root to: "home#index"
end
