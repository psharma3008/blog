# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :blogger do
    resources :articles do
      get 'verify', on: :member
      resources :comments
    end
  end
  root 'blogger#index'
end
