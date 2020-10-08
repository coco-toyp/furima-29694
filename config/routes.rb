Rails.application.routes.draw do
  devise_for :users
  resources :goods
  root to: "goods#index"
  resources :orders
end
