Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  authenticated :user do
    root to: 'groups#index', as: :authenticated_root
  end
  root to: 'groups#index'

  resources :users do
    resources :groups do
      resources :wallets
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
