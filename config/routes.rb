Rails.application.routes.draw do

  resources :players do
    collection do
      get :NA
      get :EU
      get :SA
      get :AS
      get :OC
    end
  end

  root 'players#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
