Rails.application.routes.draw do
  root to: "books#top"
  devise_for :users
  resources :books
  resources :users
  get 'homes' => 'homes#index'
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end