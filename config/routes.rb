Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/edit'
  root 'joblists#index'
  resources :joblists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
