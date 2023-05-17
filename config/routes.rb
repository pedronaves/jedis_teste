# frozen_string_literal: true

Rails.application.routes.draw do
  resources :municipes do
    get 'show_address', action: :show_address, controller: 'municipes'
    resources :addresses
  end

  root 'municipes#index'
  mount LetterOpenerWeb::Engine, at: '/inbox'

end