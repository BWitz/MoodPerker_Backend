Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do

        resources :users, only: [:index, :create, :update, :destroy]

        resources :happyimgs, only: [:index, :create, :update, :destroy]

        resources :sadimgs, only: [:index, :create, :update, :destroy]

        resources :contentimgs, only: [:index, :create, :update, :destroy]

        resources :happynews, only: [:index, :create, :update, :destroy]

        resources :sadnews, only: [:index, :create, :update, :destroy]

        resources :contentnews, only: [:index, :create, :update, :destroy]
      end
    end
end
