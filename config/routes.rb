Rails.application.routes.draw do

  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :users, only: [:index, :show] do
    member do
      get :followers, :following
    end
  end
  resources :posts, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
end
