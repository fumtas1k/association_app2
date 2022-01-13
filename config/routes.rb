Rails.application.routes.draw do
  rout "blogs#index"
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users, only: %i[show new create destroy]
  resources :sessions, only: %i[new create destroy]
  resources :favorites, only: %i[create destroy]
end
