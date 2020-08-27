Rails.application.routes.draw do
  root 'sessions#new'
  get 'sessions', to: 'sessions#new'
  resources :pictures
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:index, :create, :destroy] do
    member do
      get :index
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
