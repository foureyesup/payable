Rails.application.routes.draw do
  resources :invoices do
    get :autocomplete_customer_company, :on => :collection
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
