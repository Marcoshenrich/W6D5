Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cats#index"

  resources :cats, except: [:destroy] do 
    resource :cat_rental_requests, only: [:new]
  end

  get '/delete/:id', to: 'cats#destroy', as: 'delete_cat'

  resources :cat_rental_requests, only: [:new, :create]
  
end
