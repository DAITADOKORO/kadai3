Rails.application.routes.draw do

  root 'home#top'
  get 'home/about' => 'home#about'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]

  resources :users, only: [:index, :show, :edit, :update]


end
