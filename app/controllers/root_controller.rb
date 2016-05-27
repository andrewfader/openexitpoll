include Geokit::Geocoders
class RootController < ApplicationController
  def index
    @lat_lng = cookies[:lat_lng] && cookies[:lat_lng].split("|")
    @location = MultiGeocoder.geocode(@lat_lng).formatted_address
  end
end
