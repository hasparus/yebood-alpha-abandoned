# frozen_string_literal: true
Rails.application.routes.draw do
  resources :categories, only: [:show, :index]

  root 'categories#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  get '/setup' => 'setup#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
