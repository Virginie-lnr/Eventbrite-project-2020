Rails.application.routes.draw do
  get 'avatars/create'
  # get 'users/show'
  root to: 'events#index'

  devise_for :users
  resources :attendances
  resources :events
  post 'events/subscribe/:id', to: 'events#subscribe', as: 'subscribe'

  resources :users do
    resources :avatars, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
