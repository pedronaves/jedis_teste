# frozen_string_literal: true

Rails.application.routes.draw do
  resources :municipes do
    get 'show_address', action: :show_address, controller: 'municipes'
    resources :addresses
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'municipes#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
