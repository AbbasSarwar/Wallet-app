Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/show'
  root 'groups#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
