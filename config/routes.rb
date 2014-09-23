Rails.application.routes.draw do
  get 'api/item/all', to: 'item#all'
  get 'api/item/:id', to: 'item#show'
  put 'api/item/:id', to: 'item#update'
  post 'api/item/create', to: 'item#create'
  delete 'api/item/:id', to: 'item#delete'

  root 'application#index'
  get '*path', to: 'application#index'
end
