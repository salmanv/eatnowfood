json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name, :address, :description, :open_time, :close_time
  json.url restaurant_url(restaurant, format: :json)
end
