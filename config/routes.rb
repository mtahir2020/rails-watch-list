Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lists#index"

  resources :lists, only: [:index, :show, :create, :destroy, :edit, :update] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: [:index, :new, :create]
  end
  resources :bookmarks, only: [:destroy, :index]
  resources :reviews, only: [:destroy]
end
