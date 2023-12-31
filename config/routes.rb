# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'posts#index'

  resources :users, only: [:index]
  resources :friend_requests, only: %i[create index update]
  resources :posts, only: %i[index show new create] do
    resources :comments, only: %i[new create]
    resources :likes, only: [:create]
  end
end
