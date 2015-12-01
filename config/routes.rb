Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  resources :teams

  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
end
