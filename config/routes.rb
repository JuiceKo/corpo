Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  root "corporations#index"

  resources :corporations do
    resources :adherents do
      get :new_avec_adherent, on: :collection
      post :create_avec_adherent, on: :collection
      resources :formulaires, only: [:edit, :update, :show, :new, :create, :destroy] do
        get 'download', on: :member
      end
    end
  end
end