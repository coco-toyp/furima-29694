Rails.application.routes.draw do
  devise_for :users
  resources :goods do
    resources :orders ,only: [:index, :create]
  end
  root to: "goods#index"
end
