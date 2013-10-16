class Restaurant < ActiveRecord::Base
validates :name, :address, :city, :province, :country, presence: true

	geocoded_by :gmaps4rails_address

	# reverse_geocoded_by :latitude, :longitude, :location_address => :full_address

	after_validation :geocode, :reverse_geocode

	acts_as_gmappable 
	

	def self.search(search)
		if search
			@restaurant = Restaurant.near(search, 10, :units => :km)
		else
			@restaurant = Restaurant.all
		end
	end

	def gmaps4rails_address
		[address, city, province, country].compact.join(', ')
	end
end





