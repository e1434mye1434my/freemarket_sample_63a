Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/upp'
  root to: 'messages#index'
  get 'orders/new'
  get 'products/show'
end
