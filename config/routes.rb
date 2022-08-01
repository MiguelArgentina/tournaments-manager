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
  resources :clan_leaders, only: [:new, :show] do
    member do
      resources :clan_members do
        patch 'toggle_active', to: 'clan_members#toggle_active'
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'static_pages#landing_page'
  get 'tournaments/my_agenda', to: 'tournaments#my_agenda'
  resources :tournaments, only: [:create, :update, :index, :new, :show]
  resources :registrations, only: [:create, :update, :index, :new]
  post 'registrations/register_player'
  get "/time_zones/search" => "time_zones#search"
end
