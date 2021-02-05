Rails.application.routes.draw do
  devise_for :users
  #devise_for :businesses
  root to: 'pages#home'

  resources :positions, only: [ :index, :show, :new, :create] do
    resources :submissions, only: [ :new, :create]
  end

  resources :submissions, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :business_positions do
    resources :business_submissions, only: [ :index, :show, :edit, :update]
  end


  # get "business_positions", to: "business_positions#index", as: "business_positions"

resources :business_submissions, only: :index
end


