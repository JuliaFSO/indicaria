Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "dashboard", to: "pages#dashboard"
  get "user_preferences", to: "pages#user_preferences"
  get "profile", to: "pages#profile", as: :profile
  get "credits", to: "pages#credits", as: :credits
  
  resources :movie_picks 
  
  patch "/:id/refuse", to: "movie_picks#refuse", as: :refuse
  patch "/:id/watch_movie", to: "movie_picks#watch_movie", as: :watch_movie
  patch "/:id/add_to_watch_list", to: "movie_picks#add_to_watch_list", as: :add_to_watch_list
  patch "/:id/remove_from_watch_list", to: "movie_picks#remove_from_watch_list", as: :remove_from_watch_list
  patch "/:id/add_to_profile", to: "movie_picks#add_to_profile", as: :add_to_profile

  resources :movies, only: [:index, :show]

end
