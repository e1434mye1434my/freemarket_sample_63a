Rails.application.routes.draw do
  root to: 'kari#index'
  get 'exhibition/index'
end
