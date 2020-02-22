Rails.application.routes.draw do
  root to: 'kari#index'
  get 'orders/new'
end
