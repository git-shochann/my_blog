Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  # resources :posts, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :posts, except: :index
  resources :users, only: :show
end
