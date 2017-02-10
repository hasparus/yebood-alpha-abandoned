# frozen_string_literal: true
Rails.application.routes.draw do
  get 'locale/set'

  # Nie zmieniaj kolejnosci, te reguly sie pokrywaja.

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  get '/setup' => 'setup#index'

  root 'application#index'
  get '/categories' => 'categories#index'
  #get '/:category_slug' => 'categories#show'

  post '/:category_category_slug/:topic_topic_slug(.:format)' => 'posts#create', as: 'cool_post_create'

  resources :categories,
            only: [:show, :index],
            param: :category_slug,
            path: '/' do

    resources :topics,
              except: [:index],
              param: :topic_slug,
              path: '/' do

      resources :posts,
                except: [:show, :index]
    end
  end
end
