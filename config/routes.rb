Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :posts
  resources :comments, only: [:create, :destroy, :show]

  root 'statics#home'
end
