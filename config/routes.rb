Rails.application.routes.draw do
  root to: "cocktails#index"

  resources :cocktails, only: [ :new, :create, :show, :destroy, :update ] do
    resources :doses, only: [ :create ]
  end

  resources :doses, only: [ :destroy ]
end
