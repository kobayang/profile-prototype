Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :users, only: :index do
    resource :profile, only: [:show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
