Rails.application.routes.draw do
  get 'sessions/create'
  resources :admins, only: [:create]
  resources :main_topics, :categories
  resources :locations
  resources :timeline_events
  resources :event_dates
  resources :timesuck_episodes
  post '/login', to: 'sessions#create'
  post '/search', to: 'main_topics#search'

  get 'timeline_events/search_by_main_topic/:maintopic_name', to: 'timeline_events#search_by_main_topic'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
