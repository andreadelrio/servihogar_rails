ServihogarRails::Application.routes.draw do
  root 'providers#home'

  resources :providers

  resources :providers_sessions, only: [:new, :create, :destroy]

  match '/salir', 
      to: 'providers_sessions#destroy', as: 'salir', via: :delete

  resources :categories, only: [:show]

end
