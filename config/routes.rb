Rails.application.routes.draw do
  resources :articles

  get ':id', to: 'urls#show_url'

  resources :urls do
    get :show_top_100, on: :collection
  end
end
