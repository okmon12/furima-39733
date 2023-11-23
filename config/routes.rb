Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :edit, :index, :show, :create, :update, :destroy]
end
