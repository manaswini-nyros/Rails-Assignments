Rails.application.routes.draw do
  get 'users/new'
  get 'sessions/new'
  resources  :articles,:users,:sessions
  # root to: 'articles#index'
  # resources :authors  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  # post "/log_in"=> "articles#index" :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

 root to:"sessions#new"
  resources :categories do
  	resources :articles,shallow: true
  end
  get 'articles/:id', to:'articles#show'
  get '/sign_up', to: redirect('/log_in')
  
end