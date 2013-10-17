json.array!(@visitors) do |visitor|
  json.extract! visitor, :longitude, :latitude
  json.url visitor_url(visitor, format: :json)
end
