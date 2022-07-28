Rails.application.routes.draw do
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'

  devise_for :players, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  devise_for :clan_leaders, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  #get 'static_pages/dashboard'
  resources :clan_leaders, only: [:new, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'static_pages#landing_page'
  get 'tournaments/my_agenda', to: 'tournaments#my_agenda'
  resources :tournaments, only: [:create, :update, :index, :new, :show]
  resources :registrations, only: [:create, :update, :index, :new]
  post 'registrations/register_player'
end
