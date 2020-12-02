Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  scope :profiles do
    post 'index', to: "profiles#index", as: 'profiles_index'
    post ':id/follow', to: "profiles#follow", as: "follow"
    post ':id/unfollow', to: "profiles#unfollow", as: "unfollow"
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages


  resources :topics, only: [:index, :new, :create, :show] do
    resources :posts, only: [:new, :create]
  end
  resources :posts, only: [:edit, :update, :destroy]
  resources :topics, only: [:edit, :update, :destroy]

end
