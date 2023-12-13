Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users
  resources :npc
  resources :npc do
    collection do
      get :search
      post :create
    end
  end

  resources :groups
  get "mj", to: "pages#mj"
  get "joueur", to: "pages#joueur"
  get 'search_joueur', to: 'groups#add_joueur'



  # Defines the root path route ("/")
  # root "posts#index"
end
