Rails.application.routes.draw do
  devise_for :users
  root 'statics#home'
end
