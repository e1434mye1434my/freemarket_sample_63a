Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/upp'
  root to: "messages#index"
  # resources :messages, only: [:edit, :update]
  resources :messages, only: [:index, :edit, :update]
end
