Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do

        resources :users, only: [:index]

        resources :happyimgs, only: [:index]

        resources :sadimgs, only: [:index]

        resources :contentimgs, only: [:index]

        resources :boredimgs, only: [:index]

        resources :happynews, only: [:index, :create]

        resources :sadnews, only: [:index, :create]

        resources :contentnews, only: [:index, :create]

        resources :borednews, only: [:index, :create]

        resources :happyquotes, only: [:index, :create]

        resources :sadquotes, only: [:index, :create]

        resources :boredquotes, only: [:index, :create]
      end
    end
end
