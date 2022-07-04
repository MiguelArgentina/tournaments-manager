Rails.application.routes.draw do
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'static_pages#landing_page'
  get 'tournaments/my_agenda', to: 'tournaments#my_agenda'
  resources :tournaments, only: [:create, :update, :index, :new, :show]
  resources :registrations, only: [:create, :update, :index, :new]
  post 'registrations/register_player'
end
