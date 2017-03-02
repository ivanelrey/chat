Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources 'users'

  resources 'profiles'
  post "/profiles/update_profile" => "profiles#update_profile"

  resources 'friendships'#, :except => [ :create ]
  post "/friendships/update_friendship" => "friendships#update_friendship"

  resources 'languages'
  get "/languages/learns_languages" => "languages#learns_languages"

  post "/languages_users/remove_user_language" => "languages_users#remove_user_language"
  post "/languages_users/add_user_language" => "languages_users#add_user_language"

  post "/users_learn_languages/remove_user_learns_language" => "users_learn_languages#remove_user_learns_language"
  post "/users_learn_languages/add_user_learns_language" => "users_learn_languages#add_user_learns_language"

  resources 'visited_countries'
  post "visited_countries/add_country" => "visited_countries#add_country"
  post "visited_countries/remove_country" => "visited_countries#remove_country"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
