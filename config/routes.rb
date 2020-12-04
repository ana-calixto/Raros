Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  scope :profiles do
    post 'index', to: "profiles#index", as: 'profiles_index'
    post ':id/follow', to: "profiles#follow", as: "follow"
    post ':id/unfollow', to: "profiles#unfollow", as: "unfollow"
    get ':id/show', to: "profiles#show", as: "profile"
  end

  resources :chatrooms, only: [:show, :create, :index] do
    resources :messages, only: :create
  end

  resources :pages
    get '/search', to: "pages#search", as: "search"


  resources :topics, only: [:index, :new, :create, :show] do
    resources :posts, only: [:new, :create]
  end
  resources :posts, only: [:edit, :update, :destroy]
  resources :topics, only: [:edit, :update, :destroy]

  post "add-like-topic/:id", to: 'topics#add_topic_like', as: "like_topic"

  post "add-like-post/:post_id", to: 'posts#add_post_like', as: "like_post"

end
