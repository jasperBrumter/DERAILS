Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home', as: 'home'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/tickets/:id/details', to: 'tickets#details', as: 'details'
  resources :tickets do
    resources :responses, except: [:index, :new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
