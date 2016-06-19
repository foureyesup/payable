Rails.application.routes.draw do
  resources :invoices
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
