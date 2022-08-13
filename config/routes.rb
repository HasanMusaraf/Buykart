
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
  post 'review', to: 'products#review'
  root 'products#index'
end
