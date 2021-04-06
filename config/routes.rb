Rails.application.routes.draw do
  get '/search', to: 'search#search'
   get 'search/search'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
   resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
 end
  resources :users, only: [:index, :show, :edit, :update]do
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'users#followings', as: 'followings'
  get 'followers' => 'users#followers', as: 'followers'
 end
end