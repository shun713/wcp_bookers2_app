Rails.application.routes.draw do
  get "home/about" => "homes#about" ,as:"about"
  root to: "homes#top" 
  devise_for :users
  resources :books
  resources :users
 
end
