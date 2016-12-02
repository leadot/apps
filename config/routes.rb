Rails.application.routes.draw do
  resources :neighborhoods
  root to: 'neighborhoods#index'
end
