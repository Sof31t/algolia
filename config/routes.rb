Rails.application.routes.draw do
  root to: 'home#index'

  scope module: :api do
    scope module: :v1 do
      resources :apps, path: '/api/1/apps', only: :destroy
      resources :apps, path: '/api/1/apps', only: [:create, :update], defaults: {format: 'json'}
    end
  end
end
