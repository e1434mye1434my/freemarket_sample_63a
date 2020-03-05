Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/upp'
  root to: "messages#index"
  root to: 'kari#index'
  get 'orders/new'
  get 'products/show'
end
