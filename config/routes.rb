Rails.application.routes.draw do
  root to: 'homes#top'
  get "home/about" => "homes#about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy,]
    get "follow" => "relationships#follow_index", as: "follow"
    get "follower" => "relationships#follower_index", as: "follower"
  end
  get '/search' => 'searches#search'
  get '/search_index' => 'searches#index'
end
