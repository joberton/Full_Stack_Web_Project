Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources 'consoles' do
    get "add_shopping_cart", to: "consoles#add_to_cart"
  end
  resources 'games' do
    get "add_shopping_cart", to: "games#add_to_cart"
  end
  resources 'genres'
  resources 'shopping_cart'
  resources 'home'
  root 'home#index'
end
