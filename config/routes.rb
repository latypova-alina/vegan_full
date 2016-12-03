Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :categories
  root to: "foods#index"
  get '/delete_food/:id' => 'foods#destroy', as: 'delete_food'


end
