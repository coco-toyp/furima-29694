Rails.application.routes.draw do
  devise_for :users
  resources :goods, only: [:index, :new, :create]
  root to: "goods#index"
end
