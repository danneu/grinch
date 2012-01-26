Grinch::Application.routes.draw do
  get "about-me" => "pages#about_me", as: "about_me"
  get "projects" => "pages#projects", as: "projects"

  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  resources :sessions

  get "admin" => "admin/posts#index", as: "admin"
  namespace :admin do
    resources :posts, :categories
  end

  resources :posts
  resources :categories
  root :to => 'posts#index'
end
