class Visitor < ActiveRecord::Base
	validates :longitude, :latitude, presence: true

	geocoded_by :gmaps4rails_lola

	# reverse_geocoded_by :latitude, :longitude, :location_address => :full_address

	after_validation :geocode, :reverse_geocode

	acts_as_gmappable 
	

	def self.search(search)
		# if search
		# 	@visitor = Visitor.near(search, 10, :units => :km)
		# else
			@visitor = Visitor.all
		# end
	end

	def gmaps4rails_lola
		[longitude, latitude].compact.join(', ')
	end
end





