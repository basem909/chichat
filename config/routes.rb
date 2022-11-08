Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  get 'user/:id', to: 'users#show', as: 'user'
end
