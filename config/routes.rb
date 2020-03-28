Rails.application.routes.draw do
  devise_for :users
  root to: 'toppage#index'
  get 'messages/index'
  get 'messages/upp'
  resources :products, only: [:show, :destroy]

  resource :cards, only: [:new, :create,:destroy, :show]

  resources :order, only: %i[index] do
    member do
      get '/buy', to: 'orders#new'
      post '/pay', to: 'orders#pay'
    end
  end


  resources :mypages, only: [:index] do
    collection do
      get 'logout', to: 'mypages#logout'
    end
  end
end
