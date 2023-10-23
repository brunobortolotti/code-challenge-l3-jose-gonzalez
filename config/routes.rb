Rails.application.routes.draw do
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get 'up' => 'rails/health#show', as: :rails_health_check
  #
  # # Defines the root path route ("/")
  # # root "posts#index"
  # resources :test do
  #   get :hello_world, on: :collection
  # end
  #
  # resources :articles

  get ':id', to: 'urls#show_url'

  resources :urls do
    get :show_top_100, on: :collection
  end
end
