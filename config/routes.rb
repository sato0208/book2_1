Rails.application.routes.draw do

  devise_for :users
  root 'books#index'

  get 'books/top' => 'books/top'
  get 'books/about' => 'books/about'

  resources :books, only:[:new, :index, :edit, :show, :create, :update, :destroy]
  resources :users, only:[:new, :index, :edit, :show, :create, :update]
end
