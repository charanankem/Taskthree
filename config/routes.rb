Rails.application.routes.draw do
  devise_for :users
  resources :users 
  resources :food_reviews do 
    resources :reviews
  end
  resources :function_hall_reviews do 
    resources :reviews
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  get 'homepage', to:"home#homepage"
end
