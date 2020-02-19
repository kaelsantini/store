Rails.application.routes.draw do
  get 'welcome/index'

  resources :categories
  resources :products, except: :show

  root 'welcome#index'
end
