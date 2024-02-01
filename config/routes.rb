# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#welcome'
  get 'about', to: 'pages#about'
  get 'random', to: 'hexagrams#random'
  resources :hexagrams, only: %i[index show]
end
