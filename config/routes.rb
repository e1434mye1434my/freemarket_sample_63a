Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/upp'
  root to: "messages#index"
end
