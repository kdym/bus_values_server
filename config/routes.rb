Rails.application.routes.draw do
  scope 'prices', as: 'prices' do
    get ':vehicle', to: 'prices#index'
    get ':vehicle/edit', to: 'prices#edit', as: 'edit'
    post ':vehicle', to: 'prices#update'
  end

  resources :days
  resources :vehicles

  devise_for :users

  root 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
