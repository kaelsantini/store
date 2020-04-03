Rails.application.routes.draw do
  get 'welcome/index'
  

  resources :categories
  resources :products, except: :show

  get 'clients/login', to: 'login#index'
  post 'clients/login', to: 'login#login'

  get 'clients', to: 'clients#index'
  get 'clients/pre_add_product', to: 'clients#pre_add_product'
  post 'clients/add_product', to: 'clients#add_product'
  

  root 'welcome#index'
end
