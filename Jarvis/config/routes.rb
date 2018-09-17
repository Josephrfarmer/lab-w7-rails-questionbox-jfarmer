Rails.application.routes.draw do
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
    end
end