Grinch::Application.routes.draw do
  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  resources :sessions

  resources :posts
  resources :categories
  root :to => 'posts#index'
end
