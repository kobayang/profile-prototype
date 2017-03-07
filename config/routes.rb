Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :users, only: :index do
    resource :profile, only: [:show, :edit, :update] do
      resources :skills, only: [:new, :create]
    end
    resources :profile_skills, only: [:destroy]
  end

  post 'users/:user_id/profile_skill/:profile_skill_id/evaluators/', to: 'evaluators#create', as: 'evaluators'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
