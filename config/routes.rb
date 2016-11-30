Rails.application.routes.draw do

  resources :motorcycles do
    resources :reservations, only: [:show, :new, :create]
  end

  get 'search', to: 'motorcycles#index'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"
end
