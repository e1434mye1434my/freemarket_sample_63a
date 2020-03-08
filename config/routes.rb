Rails.application.routes.draw do
  resources :toppage, only: [:index]
  get 'messages/index'
  get 'messages/upp'
  root to: 'kari#index'
  get 'orders/new'
  get 'products/show'
end
