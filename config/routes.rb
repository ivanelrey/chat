Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources 'users'
  resources 'profiles'
  resources 'friendships'#, :except => [ :create ]
  #post "/friendship/:user_id/:friend_id" => "friendships#create"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
