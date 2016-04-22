Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :posts

  root 'statics#home'
end
