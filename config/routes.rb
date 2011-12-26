Grinch::Application.routes.draw do
  resources :posts
  resources :categories
  root :to => 'posts#index'
end
