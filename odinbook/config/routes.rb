Rails.application.routes.draw do

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  get '/user/:username', to: "profiles#show", as: 'user'

  # Defines a resourceful route for posts
  resources :posts

  #Define resources for interactions, but only needed for create and destroy actions
  resources :interactions, only: [:create, :destroy]

  # Define resources for interactions, but only needed for index, create and destroy actions
  resources :users do
    resources :relations, only: [:create, :destroy, :index]
  end

  # Usefull for linking a post to it's user
  resources :users do
    resources :posts
  end

  #Define the route for the profile of a user
  resources :users do
    resources :profiles, only: [:show]
  end

  #Usefull for linking comments to it's post
  resources :posts do
    resources :comments
  end

  root "pages#home"
end
