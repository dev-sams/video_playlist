Rails.application.routes.draw do
  root 'videos#index'
  resources :videos, only: [:index] do
    member do
      post 'add_to_playlist/:playlist_id', action: :add_to_playlist, as: :add_to_playlist
      delete 'remove_from_playlist/:playlist_id', action: :remove_from_playlist, as: :remove_from_playlist
    end
  end
end
