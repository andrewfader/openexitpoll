Rails.application.routes.draw do
  root to: "root#geolocate"
  get :index, to: 'root#index'
  get :search, to: 'root#search'
  get :enter_address, to: 'root#enter_address'
end
