include Geokit::Geocoders
class RootController < ApplicationController
  def geolocate
  end

  def index
    @user = User.find_by(hashed_ip: OpenSSL::Digest::SHA512.new.hexdigest(request.ip))
    unless @user && @user.vote
      @lat_lng = cookies[:lat_lng] && cookies[:lat_lng].split("|")
      if @lat_lng.present?
        geocode = MultiGeocoder.geocode(@lat_lng.join(" "))
        @address1 = geocode.all.last.formatted_address
        @address2 = geocode.formatted_address
        @state = geocode.state
        cookies[:state] = @state
      end
    end
  end

  def search
    if params[:location]
      @address = URI.decode(params[:location])
      @user = User.find_by(hashed_address: OpenSSL::Digest::SHA512.new.hexdigest(params[:location]))
      if @user && @user.vote
        flash[:notice] = 'A user with this address, which was stored as a non-identifiable cryptographic hash, has already recorded a vote.'
        redirect_to index_path
      elsif @user
        cookies[:user_id] = @user.id
      else
        @user = User.create(hashed_ip: OpenSSL::Digest::SHA512.new.hexdigest(request.ip),
                            hashed_address: OpenSSL::Digest::SHA512.new.hexdigest(params[:location]), state: cookies[:state])
        cookies[:user_id] = @user.id
      end
    else
      redirect_to index_path
    end
  end

  def enter_address
    if params[:address]
      @lat_lng = cookies[:lat_lng] && cookies[:lat_lng].split("|")
      if @lat_lng.present?
        geocode = MultiGeocoder.geocode(@lat_lng.join(" "))
        distance = geocode.distance_from(params[:address])
        if distance > 100
          flash[:notice] = "Address entered was more than 100 miles from current location."
          render :enter_address
        else
          redirect_to search_path(location: MultiGeocoder.geocode(params[:address]).formatted_address)
        end
      end
    end
  end

  def vote
    @user = User.find(cookies[:user_id]) || User.find_by(hashed_ip: OpenSSL::Digest::SHA512.new.hexdigest(request.ip))
    if @user && !@user.vote
      @user.update_attributes(polling_location: params[:address])
    end
  end

  def record_vote
    @user = User.find(cookies[:user_id]) || User.find_by(hashed_ip: OpenSSL::Digest::SHA512.new.hexdigest(request.ip))
    unless @user.vote
      @user.update_attributes(vote: params[:vote])
    else
      flash[:notice] = 'A user with this address, which was stored as a non-identifiable cryptographic hash, has already recorded a vote.'
      redirect_to index_path
    end
  end
end
