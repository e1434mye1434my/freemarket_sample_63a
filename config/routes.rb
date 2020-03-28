Rails.application.routes.draw do
  devise_for :users
  root to: 'toppage#index'
  get 'messages/index'
  get 'messages/upp'
  root to: 'kari#index'
  resources :exhibition
  get 'orders/new'
  get 'mypages/index'
  resources :products, only: [:show, :destroy]

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
