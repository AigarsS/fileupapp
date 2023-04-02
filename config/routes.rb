Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "uploads#index"

  resources :uploads do
    get :pdf_printout, on: :collection
  end
end
