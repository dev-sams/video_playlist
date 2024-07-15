Rails.application.routes.draw do
  root 'videos#index'
  resources :videos, only: [:index] do
    member do
      get 'playlists'
      post 'update_playlists'
    end
  end
end
