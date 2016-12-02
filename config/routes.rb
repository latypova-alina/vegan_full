Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :categories
  root to: "foods#index"

end
