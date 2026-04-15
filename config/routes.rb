Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # 1. Nesting: Wir schachteln Favorites unter Plants
  resources :plants, only: [:index, :show] do
    resources :favorites, only: [:create]
  end

  # 2. Die Übersicht deiner Favoriten (Der "Garden")
  resources :favorites, only: [:index, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
