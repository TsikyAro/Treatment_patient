Rails.application.routes.draw do
  # Admin
  resources :categories, only: [:index, :create, :destroy]
  resources :traitements, only: [:index, :create]

  # Route pour la mise à jour JSON d'un traitement
  patch '/traitements/:id/update_json', to: 'traitements#update_json_field', as: 'update_traitement_json'

  # Définition des routes API Front
  namespace :api do
    namespace :v1 do
      resources :patients, only: [:show]
      post 'patients/check_patient', to: 'patients#check_patient'
      resources :traitements, only: [:index, :create]
      resources :patient_traitements, only: [:create]
    end
  end

  # Route racine
  root "categories#index"
end
