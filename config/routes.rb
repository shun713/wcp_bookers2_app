Rails.application.routes.draw do
  get "homes/about" => "homes#about" ,as:"about"
  root to: "homes#top" ,as:"top"
  devise_for :users
  resources :books
  resources :users
 
end
