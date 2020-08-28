Rails.application.routes.draw do
  root 'sessions#new'
  get 'sessions', to: 'sessions#new'
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:index, :create, :destroy] do
    member do
      get :index
    end
  end

  # 本番環境に適用させる
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
