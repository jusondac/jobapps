Rails.application.routes.draw do
  get 'sign_up' =>'users#new',as:'sign_up'
  root 'joblists#index'
  resources :users
  resources :joblists
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
