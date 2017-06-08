Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :categories
  resources :recipes
  resources :recipe_categories
  resources :baskets
  resources :likes
  root to: "recipes#index"
  get '/dislike_recipe/:id' => 'likes#dislike_recipe', as: 'dislike_recipe'
  get '/liked_recipe/:id' => 'likes#like_recipe', as: 'like_recipe'
  get '/delete_food/:id' => 'foods#destroy', as: 'delete_food'
  get '/delete_recipe/:id' => 'recipes#destroy', as: 'delete_recipe'
  get '/delete_category/:id' => 'categories#destroy', as: 'delete_category'
  get '/delete_recipe_category/:id' => 'recipe_categories#destroy', as: 'delete_recipe_category'
  get '/add_to_basket/:id' => 'baskets#add_to_basket', as: 'add_to_basket'
  get '/delete_from_basket/:id' => 'baskets#delete_from_basket', as: 'delete_from_basket'
  get '/search' => 'recipes#search', as: 'search_recipes'


end
