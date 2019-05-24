Rails.application.routes.draw do
  root 'cocktails#index'

  resources :cocktails, only: %i[index show new create] do
    resources :doses, only: %i[new create]
  end

  resources :ingredients, only: :index

  resources :doses, only: :destroy
end
