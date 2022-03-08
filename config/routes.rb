Rails.application.routes.draw do

  devise_for :users

  root "posts#index"
  get "posts/detail/:id" => "posts#detail"

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :posts
end
