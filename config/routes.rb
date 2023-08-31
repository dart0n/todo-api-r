Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post   'signup', to: 'users#create'
      post   'login',  to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'

      resources :projects, only: %i[create index] do
        resources :tasks, only: %i[create update]
      end

      resources :tasks, only: %i[index]
    end
  end
end
