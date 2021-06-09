Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "dashboard", to: "pages#dashboard"
  get "user_preferences", to: "pages#user_preferences"
  
  resources :movie_picks do
    patch "refuse", to: "movie_picks#refuse"
  end

end
