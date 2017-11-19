Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources 'consoles'
  resources 'games'
  resources 'genres'
  resources 'shopping_cart'
  get 'games/:id/add_to_cart', to: 'games#add_to_cart', as: 'add_game_cart'
  get 'consoles/:id/add_to_cart', to: 'consoles#add_to_cart', as: 'add_console_cart'
  root 'home#index'
end
