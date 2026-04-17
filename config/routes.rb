Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :plants, only: [:index, :show] do
    resources :favorites, only: [:create]
      collection do
      get :results
    end
  end

  resources :favorites, only: [:index, :destroy]

  resources :chats, only: [:new, :create, :show] do
    resources :messages, only: [:create]
  end
end
