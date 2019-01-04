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
   match 'users', to: 'users#show', via: [:get, :post]
end
# Rails.application.routes.draw do
#   get 'sessions/new'
#   get "log_out", to: "sessions#destroy", :as => "log_out"
#   get "log_in", to: "sessions#new", :as => "log_in"
#   get "sign_up", to: "users#new", :as => "sign_up"
#   resources :articles, :users, :sessions
#   root to: "articles#index"
#   resources :articles do
#     resources :comments, shallow: true
#   end
#   get 'articles/:id', to: 'articles#show'
#   match 'users', to: 'users#show', via: [:get, :post]
# end