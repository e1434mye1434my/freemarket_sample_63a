Rails.application.routes.draw do
  root to: 'kari#index'
  get 'exhibition/index'
  get 'orders/new'
  get 'products/show'
end
