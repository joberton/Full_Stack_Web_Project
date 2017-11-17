Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'consoles', to: 'consoles#index', as: 'consoles'
  get 'consoles/:id', to: 'consoles#findConsole', as: 'console', id: '/\d+/'
  get 'games', to: 'games#index', as: 'games' 
  get 'games/:id', to: 'games#findGame', as: 'game', id: '/\d+/'
  get 'genres', to: 'genres#index', as: 'genres'

  root 'home#index'
end
