# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show]
  resources :events, only: %i[index create show]

  root to: 'events#index'
end
