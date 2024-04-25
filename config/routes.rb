Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Project submissions
  resources :projects do
    resources :packages, only: [:create, :update, :destroy]
    resources :milestones, only: [:create, :update, :destroy]
  end

  # Admin actions
  get 'admin/projects', to: 'admin#projects'
  patch 'admin/projects/:id/approve', to: 'admin#approve_project'
end