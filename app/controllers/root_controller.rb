include Geokit::Geocoders
class RootController < ApplicationController
  def geolocate
    redirect_to index_path
  end

  def index
    @lat_lng = cookies[:lat_lng] && cookies[:lat_lng].split("|")
    if @lat_lng.present?
      @location = MultiGeocoder.geocode(@lat_lng.join(" ")).formatted_address
    end
  end

  def search

  end

  def enter_address
  end
end
