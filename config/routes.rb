Rails.application.routes.draw do
  root 'welcome#index'
  resources :hexagrams, only: [:index, :show]
end
