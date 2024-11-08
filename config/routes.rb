Rails.application.routes.draw do
  devise_for :users
  #Representa um conjunto de rotas para todos os verbos HTTPs GET, POST, PUT, PATCH, DELETE
  resources :movies do
    member do
      delete 'photos/:photo_id', to: 'movies#destroy_photo', as: 'destroy_photo'
    end
  end
  
  get "up" => "rails/health#show", as: :rails_health_check

  # root representa a pagina inicial do projeto localhost:3000
  root "movies#index"
end
