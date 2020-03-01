Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/upp'
  root "messages#index"
  resources :messages, only: [:edit, :update]
end
