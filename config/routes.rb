# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :events, only: %i[index create]

  root to: 'events#index'
end
