Rails.application.routes.draw do
  resources :profiles, only: [:index]

  get 'profiles/:id', to: "profiles#index"

  resources :reservations, only: :show do
    resources :reviews, only: [:new, :create]
  end

  resources :reservations, only: :destroy, as: "remove_reservation"

  resources :motorcycles do
    resources :reservations, only: [:show, :new, :create]
  end

  get 'search', to: 'motorcycles#index'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"
end
