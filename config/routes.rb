Rails.application.routes.draw do
  
  devise_for :users
  
  resources :todos

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
end
