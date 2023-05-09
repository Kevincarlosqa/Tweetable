Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: :callbacks
  }
  resources :likes
  resources :tweets
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "tweets#index"

  namespace :api do # api/
    # GET /api/tweets
    resources :tweets, only: [:index]
  end
end
