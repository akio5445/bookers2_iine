Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books do
    resources :book_comments
  end
  resources :favorites, only: [:create, :destroy]
  root 'home#top'
  get 'home/about'
end