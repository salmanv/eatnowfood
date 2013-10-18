class RestaurantsController < ApplicationController
  include Yelp::V2::Search::Request
  include Yelp::V2::Business::Request

  before_action :set_restaurant, only: [ :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.search(params[:search])
    @json = Restaurant.search(params[:search]).to_gmaps4rails
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    client = Yelp::Client.new

    # @restaurant = Restaurant.find(params[:id])
    # @json = Restaurant.find(17).to_gmaps4rails

    request = Id.new(:yelp_business_id => params[:id])
    @response = client.search(request)

    @coordinates = Geocoder.search(@response["location"]["display_address"].join(", ")).first.data
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|

      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @restaurant }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end

  def find_restaurants
    @location = request.location
    # latitude = @location.latitude
    # longitude = @location.longitude

    latitude = 43.6481797
    longitude = -79.3887629
    client = Yelp::Client.new

    # FOR DEMO ONLY
    # request = GeoPoint.new(
    #          :term => "food",
    #          :latitude =>  43.6481797,#params[:latitude],
    #          :longitude => -79.3887629) #params[:longitude]

    request = GeoPoint.new(
             :term => "food",
             :latitude =>  latitude,
             :longitude => longitude) 

    @response = client.search(request)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :city, :province, :country, :description, :open_time, :close_time, :longitude, :latitude)
    end
end
#     def geolocation_params
#       params.require(:search).permit(:longitude, :latitude)
# end





