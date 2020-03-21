Rails.application.routes.draw do
  get 'welcome/index'
  get 'home', to: 'clients#index'

  resources :categories
  resources :products, except: :show

  root 'welcome#index'
end
