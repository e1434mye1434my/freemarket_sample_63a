Rails.application.routes.draw do
  root to: 'kari#index'
  get 'orders/new'
  get 'products/show'
  get 'mypages/index'
  resources :mypages, only: [:index] do
    collection do
      get 'logout', to: 'mypages#logout'
    end
  end
end
