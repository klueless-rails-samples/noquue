# frozen_string_literal: true

Rails.application.routes.draw do
  resources :suppliers
  get 'about/index'
  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
  root to: 'home#index'
end

# == Route Map
#
