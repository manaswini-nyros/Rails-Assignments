  Rails.application.routes.draw do
  resources  :articles
  root to: 'articles#index'
  resources :authors  
  get "home/download_pdf"
  end
