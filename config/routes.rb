Rails.application.routes.draw do
  
  devise_for :users
  
  resources :todos do
    member do 
      delete :destroy_all
    end
  end

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
end
