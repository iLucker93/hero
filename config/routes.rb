Rails.application.routes.draw do
  devise_for :users 
  root 'main#fight' # path on main page 


  get 'get_new_monster', to: 'main#monster'


  # Users
    resources :users
    post 'exp', to: 'users#exp'
    post 'stats', to: 'users#stats'
    post 'location', to: 'users#location'


  # Maps
    get 'map', to: 'maps#index', as: :map


  # Route special for me
    get 'fox', to: 'main#fox' ''

end