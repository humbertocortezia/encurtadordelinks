Rails.application.routes.draw do
  resources :likes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "likes#new"

  get '/:id', to: 'likes#valida'
  
end
