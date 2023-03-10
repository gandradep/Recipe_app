Rails.application.routes.draw do
  devise_for :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'recipes#public_recipes'
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index new create show destroy] do
    resources :recipe_foods, only: %i[index new create destroy]
    get 'shop_list'
  end
end
