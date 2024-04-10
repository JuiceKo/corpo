Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  root "corporations#index"

  resources :corporations do
    resources :adherents do
      resources :formulaires
    end
  end
end
