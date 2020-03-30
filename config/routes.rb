Rails.application.routes.draw do
  root 'books#top'
   get 'books/about' => 'books#about'
	# delete,create,newはdeviseが作成してくれる
  devise_for :users
  resources :users, only:[:index, :edit, :show, :update] do
    get :search, on: :collection
  end

  resources :books, only:[:new, :destroy, :index, :edit, :show, :create, :update] do
    resource :favorites, only:[:create, :destroy]
  	resource :post_comments, only: [:create,:show,:destroy] do
    post :confirm, action: :confirm_new, on: :new
  end
  end
end
