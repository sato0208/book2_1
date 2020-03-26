Rails.application.routes.draw do
  root 'books#top'

   get 'books/about' => 'books#about'

  devise_for :users
  resources :users, only:[:index, :edit, :show, :update]

  resources :books, only:[:new, :destroy, :index, :edit, :show, :create, :update] do
  	resource :post_comments, only: [:create]
  end
  get '/books' => 'books#index'
  post '/books' => 'books#create'


end
