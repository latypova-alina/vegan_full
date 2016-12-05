Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :categories
  resources :recipes
  resources :recipe_categories
  root to: "foods#index"
  get '/delete_food/:id' => 'foods#destroy', as: 'delete_food'
  get '/delete_recipe/:id' => 'recipes#destroy', as: 'delete_recipe'
  get '/delete_category/:id' => 'categories#destroy', as: 'delete_category'
  get '/delete_recipe_category/:id' => 'recipe_categories#destroy', as: 'delete_recipe_category'
  get '/add_to_basket/:id' => 'baskets#add_to_basket', as: 'add_to_basket'

end
