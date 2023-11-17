Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  post '/', to: 'items#create'
  resources :items, only: [:new, :edit, :index, :show, :create]
end
