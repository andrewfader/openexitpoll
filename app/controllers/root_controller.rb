include Geokit::Geocoders
class RootController < ApplicationController
  def geolocate
  end

  def index
    @lat_lng = cookies[:lat_lng] && cookies[:lat_lng].split("|")
    if @lat_lng.present?
      geocode = MultiGeocoder.geocode(@lat_lng.join(" "))
      @address1 = geocode.all.last.formatted_address
      @address2 = geocode.formatted_address
    end
  end

  def search
    if params[:location]
      @address = URI.decode(params[:location])
    else
      redirect_to index_path
    end
  end

  def enter_address
  end
end
