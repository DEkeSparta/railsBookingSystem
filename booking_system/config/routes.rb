Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings
  resources :rooms
  resources :requests

  get '/bookings/new/&f=:start_time&l=:end_time&d=:date', to: 'bookings#results'
  get '/bookings/new/&f=:start_time&l=:end_time&d=', to: 'bookings#new'



  post 'requests/accept', to: 'requests#add_request_to_list_of_bookings'

  root to: "bookings#index"


end
