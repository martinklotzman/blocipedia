Rails.application.routes.draw do

  resources :downgrade, only: [:new, :create]
  resources :charges, only: [:new, :create]

  devise_for :users

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  get 'about' => 'welcome#about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'

end
