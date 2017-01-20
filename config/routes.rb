Rails.application.routes.draw do
  get 'comments/create'

  devise_for :users
  resources :posts do
  	resources :comments
  end	

  resources :contacts, only: [:new, :create]
  
  root "posts#index"
end
