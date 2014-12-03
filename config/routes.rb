Rails.application.routes.draw do
  devise_for :users
  root 'main#fight'


  get 'get_new_monster', to: 'main#monster'


  # Users
    post 'exp', to: 'users#exp'
    post 'location', to: 'users#location'


  # Maps
    get 'map', to: 'maps#index', as: :map


  # Route special for me
    get 'fox', to: 'main#fox'

end