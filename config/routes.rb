Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ratings, only: [:index, :create] 
    end
  end

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :create ] 
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create] 
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
