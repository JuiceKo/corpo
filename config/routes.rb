Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "corporations#index"

  resources :corporations do
    get 'donnees/find_by_year', to: 'donnees#find_by_year', as: 'find_donnee_by_year'
    post 'corporations/save_year', to: 'corporations#save_year', as: 'save_year_corporations'
    post 'import', on: :collection
    resources :donnees, only: [:edit]
    resources :adherents do
      get :new_avec_adherent, on: :collection
      post :create_avec_adherent, on: :collection
      resources :formulaires, only: [:edit, :update, :show, :new, :create, :destroy] do
        get 'download', on: :member
      end
    end
  end
end