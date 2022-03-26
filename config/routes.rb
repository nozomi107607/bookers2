Rails.application.routes.draw do
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:index, :show, :edit, :update]

  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"
  patch 'books/:id' => 'books#update' , as: 'update_book'
end
