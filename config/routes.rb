Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :posts, only: :index do
        member do
          post :like
          post :dislike
        end

        resources :comments, only: :index
      end
    end
  end
end
