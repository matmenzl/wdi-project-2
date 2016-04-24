Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :posts
  resources :comments, only: [:create, :destroy]

  root 'statics#home'
end
