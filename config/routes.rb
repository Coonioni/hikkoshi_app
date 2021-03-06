Rails.application.routes.draw do

  devise_for :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  
  resources :notifications, only: [:index]

  root "posts#index"

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

end
