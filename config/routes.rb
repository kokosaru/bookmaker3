Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'matches#index'
  resource :user, only: [:show, :edit, :update, :destroy]
  resources :matches, only: [:index, :show]
  resources :counts

  namespace :admin do
  	resources :matches
  	resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
end
