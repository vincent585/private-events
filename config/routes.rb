# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show]
  resources :events
  resources :event_attendances, only: %i[new create destroy]

  root to: 'events#index'
end
