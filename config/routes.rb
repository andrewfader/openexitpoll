Rails.application.routes.draw do
  root to: "root#geolocate"
  get :index, to: 'root#index'
  get :search, to: 'root#search'
  get :vote, to: 'root#vote'
  get :enter_address, to: 'root#enter_address'
  get :about, to: 'root#about'
  get :record_vote, to: 'root#record_vote'
end
