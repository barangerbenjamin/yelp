Rails.application.routes.draw do
  resources :restaurants do
    collection do                       # collection => no restaurant id in URL
      get 'top', to: "restaurants#top"  # RestaurantsController#top
    end
    member do                             # member => restaurant id in URL
      get 'chef', to: "restaurants#chef"  # RestaurantsController#chef
    end
    resources :reviews, only: [ :index, :new, :create ]
  end
  namespace :admin do
      resources :restaurants, only: [:index]
    end
  resources :reviews, only: [ :show, :edit, :update, :destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
