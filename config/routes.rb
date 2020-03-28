Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/upp'
  root to: 'kari#index'
  resources :exhibition
  get 'orders/new'
  get 'products/show'
end
