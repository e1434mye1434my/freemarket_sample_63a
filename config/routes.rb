Rails.application.routes.draw do
  devise_for :users
  root to: 'toppage#index'
  get 'messages/index'
  get 'messages/upp'

  resources :products, except: :index do
    resources :likes, only: [:create, :destroy]
    member do
      get 'get_category_children', defaults: {format: 'json'}
      get 'get_category_grandchildren', defaults: {format: 'json'}
    end
    collection do
      get 'get_category_children', defaults: {format: 'json'}
      get 'get_category_grandchildren', defaults: {format: 'json'}
    end
  end

  resource :cards, only: [:new, :create,:destroy, :show]

  resources :order, only: %i[index] do
    member do
      get '/buy', to: 'orders#new'
      post '/pay', to: 'orders#pay'
      get '/done', to: 'orders#done'
    end
  end


  resources :mypages, only: [:show] do
    member do
      get 'logout', to: 'mypages#logout'
      get 'like', to: 'mypages#likes'
    end
  end
end
