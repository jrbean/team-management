Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  resources :teams
  resources :tasks, only: [ :index, :show]
  resources :users, only: [:index, :show]
  resources :teams do
    resources :tasks, only: [:new, :create, :edit, :destroy, :show]
  end

  get    'team/:id/users', to: 'teams#get_users', as: 'team_users'
  post   'team/:id/users', to: 'teams#update_team'
  post   'users/:id', to: 'users#assign_lead', as: 'assign_lead'
  patch  'users/:id', to: 'users#update_team', as: 'update_team'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'updates'  => 'static_pages#updates'
end
