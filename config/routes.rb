Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :buyers, only: [:index, :create, :new] do
    resources :shippings
  end
end
