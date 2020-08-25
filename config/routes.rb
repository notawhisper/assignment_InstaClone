Rails.application.routes.draw do
  root 'root#index'
  resources :pictures
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:index, :create, :destroy] do
    member do
      get :index
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
