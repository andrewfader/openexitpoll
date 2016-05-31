Rails.application.routes.draw do
  root to: "root#geolocate"
  get :index, 'root#index'
end
