Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings
  resources :rooms

  get '/bookings/new/&f=:start_time&l=:end_time&d=:date', to: 'bookings#results'
  get '/bookings/new/&f=:start_time&l=:end_time&d=', to: 'bookings#new'
get '/requests', to: 'bookings#requests'

  root to: "bookings#index"

end
