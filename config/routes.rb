# frozen_string_literal: true
Rails.application.routes.draw do
  # Nie zmieniaj kolejnosci, te reguly sie pokrywaja.

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  get '/setup' => 'setup#index'

  root 'categories#index'
  #get '/:category_slug' => 'categories#show'

  resources :categories,
            only: [:show, :index],
            param: :category_slug,
            path: '/' do

    resources :topics,
              except: [:index],
              param: :topic_slug,
              path: '/' do

      resources :posts
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
