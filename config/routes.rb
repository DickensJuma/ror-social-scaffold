Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end


  get 'friends', to: 'friendships#index', as: 'friends'
  get 'friends/create/:id', to: 'friendships#create', as: 'add_friend'
  get 'friends/accept.:id', to: 'friendships#accept', as: 'accept_request'
  delete 'friends/deny/:id', to: 'friendships#deny', as: 'deny_request'
  delete 'friends/delete/:id', to: 'friendships#destroy', as: 'delete_friend'
 
end
