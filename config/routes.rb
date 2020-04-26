# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#show'

  get 'auth/login', to: 'sessions#login'
  get 'auth/auth0/callback', to: 'auth0#callback'
  get 'auth/failure', to: 'auth0#failure'
  get 'auth/logout', to: 'sessions#logout'

  resources :rooms, only: :show

  namespace :api, format: :json do
    namespace :v1 do
      get 'users/me', to: 'users#me'
      resources :rooms, only: [:index, :show, :create, :destroy] do
        resources :messages, only: :create
      end
    end
  end
end
