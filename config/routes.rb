Rails.application.routes.draw do
  get 'welcome/index'
  get 'home', to: 'clients#index'

  resources :categories
  resources :products, except: :show

  get 'clients/pre_add_product', to: 'clients#pre_add_product'
  post 'clients/add_product', to: 'clients#add_product'

  root 'welcome#index'
end
