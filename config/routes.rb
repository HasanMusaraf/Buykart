# frozen_string_literal: true

Rails.application.routes.draw do
  get 'search', to: 'products#search'
  resources :products
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  get '/wish_list', to: 'products#render_wishlist'
  get 'wish_item/:product_id', to: 'products#wish_list', as: :product_id
  post 'review', to: 'products#review'
  root 'products#index'
  get 'pay', to: 'store#cash'
  get 'line', to: 'line_items#line_item'
  post 'cart', to: 'products#cart'
  get 'carts', to: 'products#carts'
  get 'del', to: 'products#del'
  post 'payment', to: 'store#create'
  get 'user_orders', to: 'store#user_orders'

  match 'status/:id', to: 'store#status', via: :get
  get 'myorder', to: 'store#my_order'
end
