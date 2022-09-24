require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users

  resources :tweets, except: [:edit, :update]
  resources :profiles

  root to: 'tweets#index'
end
