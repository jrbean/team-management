Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  resources :teams
  resources :tasks, only: [:new, :create, :edit, :destroy]
  resources :users, only: [:index, :show]

  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'updates'  => 'static_pages#updates'
end
