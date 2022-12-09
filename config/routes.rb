# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ratings, only: %i[index create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[index create]
      get '/posts/top-posts', to: 'posts#top'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index create]
      get '/users/ip-with-multiple-author', to: 'users#ip_with_multiple_authors'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
