include Geokit::Geocoders
class RootController < ApplicationController
  def index
    @location = MultiGeocoder.geocode(request.ip).city
    @lat_lng = cookies[:lat_lng].split("|")
  end
end
