Rails.application.routes.draw do
  resources :breeds
  resources :animals

  resources :adoptions do 
    post "/user/:user_id/adopt", to: "adoptions#adopt"
    post "to_enabled", to: "adoptions#to_enabled"
    post "to_disabled", to: "adoptions#to_disabled"
  end

  devise_for :users, controllers: {sessions: 'user/sessions', registrations: "registrations", passwords: "passwords"}
  resources :users do 
    get "adoptions_created", to: "adoptions#adoptions_of_a_created_user"
    get "adopted", to: "adoptions#adopted"
  end

  resources :adoptions_images, only:[:create, :update, :destroy]

  devise_scope :user do 
  	root to: "user/sessions#new"
  end
  
  devise_scope :user do 
    patch "/registrations/update_password" => "update_password"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
