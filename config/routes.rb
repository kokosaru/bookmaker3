Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'matches#index'
  resources :matches, only: [:index, :show]

  namespace :admin do
  	resources :matches
  end

end
