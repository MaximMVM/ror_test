Rails.application.routes.draw do
  get 'game/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'game#index', as: 'gi'
  post 'game' => 'game#calc'
end
