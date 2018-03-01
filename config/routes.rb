Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tickets do
  	collection do
        post :create_from_json
    end
  end
  resources :excavators
end
