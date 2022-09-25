require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users

  resources :tweets, except: [:edit, :update] do
    member do
      post :retweet
    end
  end

  resources :profiles

  root to: 'tweets#index'
end
