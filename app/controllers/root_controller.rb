include Geokit::Geocoders
class RootController < ApplicationController
  def geolocate
    @lat_lng = cookies[:lat_lng] && cookies[:lat_lng].split("|")
    redirect_to index_path
  end

  def index
    if @lat_lng.present?
      @location = MultiGeocoder.geocode(@lat_lng.join(" ")).formatted_address
      browser = Capybara.current_session
      browser.visit("http://www.sos.ca.gov/elections/polling-place/")
    end
  end
end
