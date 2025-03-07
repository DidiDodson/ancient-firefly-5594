Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :teams, only: :index
  resources :competitions, only: :show

  post '/competitions/:id/teams', to: "competition_teams#create"
end
