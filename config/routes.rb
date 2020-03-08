Rails.application.routes.draw do
  root to: 'kari#index'
  get 'orders/new'
  get 'products/show'
  get 'mypages/index'

  resources :cards, only: [:new, :show] do
    collection do
      get 'show'
    end
  end

  resources :mypages, only: [:index] do
    collection do
      get 'logout', to: 'mypages#logout'
    end
  end
end
