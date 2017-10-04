Rails.application.routes.draw do
  scope 'prices', as: 'prices' do
    get ':vehicle', to: 'prices#index'
    get ':vehicle/edit', to: 'prices#edit', as: 'edit'
    post ':vehicle', to: 'prices#update'
  end

  resources :days

  get 'vehicles', to: 'vehicles#fetch', defaults: {format: 'json'}
  resources :vehicles

  devise_for :users

  root 'dashboard#index'

  scope 'dashboard', as: 'dashboard' do
    post 'calculate', to: 'dashboard#calculate_prices', as: 'calculate'
    get 'dates', to: 'dashboard#load_dates', as: 'dates'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
