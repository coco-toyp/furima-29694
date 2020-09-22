Rails.application.routes.draw do
  resources :goods
  devise_for :users
  root to: "goods#index"
end
