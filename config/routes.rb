Rails.application.routes.draw do
  resources :breeds
  resources :animals
  resources :adoptions
  devise_for :users
  resources :users
  resources :adoptions_images, only:[:create, :update, :destroy]

  root "adoptions#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
