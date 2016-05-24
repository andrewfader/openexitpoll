include Geokit::Geocoders
class RootController < ApplicationController
  def index
    @location = MultiGeocoder.geocode(request.ip).city
  end
end
