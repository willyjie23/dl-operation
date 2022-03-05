Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  root 'home#index'

  namespace :admin do
    resources :blogs
  end
end
