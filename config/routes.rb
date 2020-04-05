Rails.application.routes.draw do
  devise_for :users
  root to: 'toppage#index'
  get 'messages/index'
  get 'messages/upp'

  resources :products, except: :index do
    member do
      get 'order'
      get 'get_category_children', defaults: {format: 'json'}
      get 'get_category_grandchildren', defaults: {format: 'json'}
    end
    collection do
      get 'get_category_children', defaults: {format: 'json'}
      get 'get_category_grandchildren', defaults: {format: 'json'}
    end
  end

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
