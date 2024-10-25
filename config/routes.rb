Rails.application.routes.draw do
  devise_for :users
  # Representa um conjunto de rotas para todos os verbos HTTPs, GET, POST, PUT, PATCH
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # root representa a página inicial do projeto localhost:3000
  root 'movies#index'
end
