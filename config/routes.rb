Rails.application.routes.draw do

  get 'homes/index'
  get 'homes/show'
  root to: 'homes#index'
  get 'post_books/new'
  get 'post_books/create'
  get 'post_books/index'
  get 'post_books/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookers

  resources :post_books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :users, only: [:index,:show, :edit, :update]

end
