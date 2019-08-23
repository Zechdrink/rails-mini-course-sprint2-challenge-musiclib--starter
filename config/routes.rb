Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :albums, only: [:index, :show] do
        resources :songs, only: [:index]
      end
      resources :artists, only: [:index, :show] do
        resources :albums, only: [:index]
      end
      resources :user, only: [:index, :show, :create] do
        resources :playlists, only: [:index, :show, :create] do
          resources :songs, only: [:index, :show]
        end
      end
    end
  end
end
