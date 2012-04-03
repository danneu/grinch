Grinch::Application.routes.draw do
  get "convert" => "content#convert", as: "convert"
  get "sitemap.xml" => "sitemaps#index", as: "sitemap", defaults: { format: 'xml' }

  get "about-me" => "pages#about_me", as: "about_me"
  get "projects" => "pages#projects", as: "projects"

  get "admin/logout" => "sessions#destroy", as: "logout"
  get "admin/login" => "sessions#new", as: "login"
  resources :sessions

  get "admin" => "admin/posts#index", as: "admin"
  namespace :admin do
    resources :posts, :categories
  end

  resources :posts
  resources :categories
  root :to => 'posts#index'
end
