Rails.application.routes.draw do
  devise_for :users
  resources :incidents
  resources :neighborhoods do
    resources :incidents
  end
  root to: 'neighborhoods#index'


end
