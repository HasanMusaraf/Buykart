# frozen_string_literal: true

Rails.application.routes.draw do
  get 'search', to: 'products#search'
  resources :line_items
  resources :carts
  resources :products
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  get '/wish_list', to: 'products#render_wishlist'
  get 'wish_item/:product_id', to: 'products#wish_list', as: :product_id

  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
