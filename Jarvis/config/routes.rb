Rails.application.routes.draw do
  # resources :answers
  root 'questions#index'
  resources :questions
  resources :answers
  resources :users
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
      resources :questions do
        resources :answers
      end 
      resources :users 
      resource :session, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end
end
end
